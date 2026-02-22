(function () {
  if (typeof window === "undefined") return;

  var STORAGE_KEY = "privchain_cookie_consent_v1";
  var consentState = readConsent();
  var listeners = [];

  function readConsent() {
    try {
      var raw = localStorage.getItem(STORAGE_KEY);
      if (!raw) return null;
      var parsed = JSON.parse(raw);
      if (!parsed || typeof parsed !== "object") return null;
      return {
        necessary: true,
        analytics: !!parsed.analytics,
        timestamp: parsed.timestamp || null,
        version: "1"
      };
    } catch (_err) {
      return null;
    }
  }

  function persistConsent(next) {
    consentState = {
      necessary: true,
      analytics: !!next.analytics,
      timestamp: new Date().toISOString(),
      version: "1"
    };
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(consentState));
    } catch (_err) {
      // Ignore write errors and keep in-memory state.
    }

    notify(consentState);
  }

  function notify(state) {
    listeners.forEach(function (fn) {
      try {
        fn(state);
      } catch (_err) {}
    });

    try {
      window.dispatchEvent(new CustomEvent("privchain:consent-changed", { detail: state }));
    } catch (_err) {}
  }

  function hasConsent(type) {
    if (!consentState) return false;
    if (type === "analytics") return !!consentState.analytics;
    return false;
  }

  function onChange(fn) {
    if (typeof fn !== "function") return;
    listeners.push(fn);
  }

  function closeBanner() {
    var banner = document.querySelector("[data-cookie-banner]");
    if (banner) banner.remove();
  }

  function showBanner() {
    if (document.querySelector("[data-cookie-banner]")) return;
    var banner = document.createElement("div");
    banner.className = "cookie-banner";
    banner.setAttribute("data-cookie-banner", "1");
    banner.setAttribute("role", "dialog");
    banner.setAttribute("aria-live", "polite");
    banner.innerHTML =
      '<div class="cookie-banner__content">' +
      '<h3>Privacy Controls</h3>' +
      '<p>Essential cookies only by default. Analytics stay disabled unless you opt in. ' +
      '<a href="privacy.html">Privacy Policy</a>.</p>' +
      "</div>" +
      '<div class="cookie-banner__actions">' +
      '<button type="button" class="btn btn-secondary cookie-btn" data-cookie-action="reject">Reject Analytics</button>' +
      '<button type="button" class="btn btn-primary cookie-btn" data-cookie-action="accept">Accept Analytics</button>' +
      "</div>";
    document.body.appendChild(banner);
  }

  function bindBannerActions() {
    document.addEventListener("click", function (event) {
      var target = event.target;
      if (!(target instanceof Element)) return;

      var action = target.getAttribute("data-cookie-action");
      if (action === "reject") {
        persistConsent({ analytics: false });
        closeBanner();
      } else if (action === "accept") {
        persistConsent({ analytics: true });
        closeBanner();
      }

      var trigger = target.closest("[data-open-consent]");
      if (trigger) {
        event.preventDefault();
        showBanner();
      }
    });
  }

  window.PRIVCHAIN_CONSENT = {
    getConsent: function () {
      return consentState;
    },
    hasConsent: hasConsent,
    setConsent: function (next) {
      persistConsent(next || {});
      closeBanner();
    },
    onChange: onChange,
    openBanner: showBanner
  };

  bindBannerActions();
  if (!consentState) {
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", showBanner);
    } else {
      showBanner();
    }
  }
})();
