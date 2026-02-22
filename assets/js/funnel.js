(() => {
  const STORAGE_KEY = "privchain_funnel_v1";
  const UTM_KEYS = [
    "utm_source",
    "utm_medium",
    "utm_campaign",
    "utm_term",
    "utm_content",
    "gclid",
    "fbclid"
  ];

  function nowIso() {
    return new Date().toISOString();
  }

  function parseQuery() {
    const params = new URLSearchParams(window.location.search);
    const out = {};
    UTM_KEYS.forEach((key) => {
      const value = params.get(key);
      if (value) out[key] = value;
    });
    return out;
  }

  function getState() {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      if (!raw) return {};
      return JSON.parse(raw);
    } catch {
      return {};
    }
  }

  function setState(next) {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
    } catch {
      // Ignore storage errors.
    }
  }

  function ensureSession(state) {
    if (!state.session_id) {
      const entropy = Math.random().toString(36).slice(2, 10);
      state.session_id = `pc_${Date.now()}_${entropy}`;
    }
    return state;
  }

  function updateAttribution() {
    const state = ensureSession(getState());
    const query = parseQuery();
    const hasQueryTouch = Object.keys(query).length > 0;
    const touch = {
      ...query,
      landing_url: window.location.href,
      path: window.location.pathname,
      referrer: document.referrer || "direct",
      ts: nowIso()
    };

    if (!state.first_touch) {
      state.first_touch = touch;
    } else if (hasQueryTouch) {
      state.last_touch = touch;
    }

    if (!state.last_touch) {
      state.last_touch = touch;
    } else if (hasQueryTouch) {
      state.last_touch = touch;
    }

    state.last_seen_at = nowIso();
    state.last_seen_path = window.location.pathname;
    setState(state);
    return state;
  }

  function maybeFillInput(form, name, value) {
    const input = form.querySelector(`input[name="${name}"]`);
    if (input && typeof value !== "undefined" && value !== null) {
      input.value = String(value);
    }
  }

  function fillFunnelForm(state) {
    const form = document.querySelector("form[data-funnel-form]");
    if (!form) return;

    const first = state.first_touch || {};
    const last = state.last_touch || {};

    maybeFillInput(form, "session_id", state.session_id || "");
    maybeFillInput(form, "source_page", window.location.href);
    maybeFillInput(form, "source_path", window.location.pathname);
    maybeFillInput(form, "referrer", document.referrer || "direct");
    maybeFillInput(form, "submitted_at", nowIso());
    maybeFillInput(form, "first_touch_json", JSON.stringify(first));
    maybeFillInput(form, "last_touch_json", JSON.stringify(last));
    maybeFillInput(form, "user_agent", navigator.userAgent);

    UTM_KEYS.forEach((key) => {
      maybeFillInput(form, key, last[key] || first[key] || "");
    });
  }

  function attachCtaTracking(state) {
    const first = state.first_touch || {};
    const last = state.last_touch || {};

    document.querySelectorAll("a[data-funnel-cta]").forEach((anchor) => {
      anchor.addEventListener("click", () => {
        const url = new URL(anchor.href, window.location.origin);
        if (!url.searchParams.get("utm_source")) {
          url.searchParams.set("utm_source", last.utm_source || first.utm_source || "privchain_site");
        }
        if (!url.searchParams.get("utm_medium")) {
          url.searchParams.set("utm_medium", last.utm_medium || first.utm_medium || "website");
        }
        if (!url.searchParams.get("utm_campaign")) {
          url.searchParams.set("utm_campaign", last.utm_campaign || first.utm_campaign || "waitlist");
        }
        url.searchParams.set("funnel_from", window.location.pathname);
        anchor.href = url.toString();
      });
    });
  }

  const state = updateAttribution();
  fillFunnelForm(state);
  attachCtaTracking(state);
})();
