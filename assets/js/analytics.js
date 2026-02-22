(function () {
  if (typeof window === "undefined") return;

  // Safe no-op fallback so pages can call this even before GA is configured.
  if (typeof window.privchainTrackEvent !== "function") {
    window.privchainTrackEvent = function () {};
  }

  var config = window.PRIVCHAIN_ANALYTICS || {};
  var measurementId = config.gaMeasurementId || "";
  if (!measurementId || measurementId === "G-XXXXXXXXXX") {
    return;
  }

  window.dataLayer = window.dataLayer || [];
  function gtag() {
    window.dataLayer.push(arguments);
  }
  window.gtag = window.gtag || gtag;

  var script = document.createElement("script");
  script.async = true;
  script.src = "https://www.googletagmanager.com/gtag/js?id=" + encodeURIComponent(measurementId);
  document.head.appendChild(script);

  gtag("js", new Date());
  gtag("config", measurementId, {
    send_page_view: true,
    anonymize_ip: true,
    allow_google_signals: false,
    allow_ad_personalization_signals: false,
    debug_mode: !!config.enableDebug
  });

  window.privchainTrackEvent = function (eventName, params) {
    if (!eventName) return;
    gtag("event", eventName, params || {});
  };
})();
