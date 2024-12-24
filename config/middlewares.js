module.exports = [
  "strapi::logger",
  "strapi::errors",
  "strapi::security",
  {
    name: "strapi::cors",
    config: {
      enabled: true, // Explicitly enable CORS
      origin: [
        "https://axiontrade.konexdigital.com", // Your allowed origin(s)
        "http://localhost:3000", // Add localhost for development if needed
      ],
      methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
      headers: [
        "Content-Type",
        "Authorization",
        "Origin",
        "Accept",
        "X-Requested-With",
      ],
      keepHeadersOnError: true,
    },
  },
  "strapi::poweredBy",
  "strapi::query",
  "strapi::body",
  "strapi::session",
  "strapi::favicon",
  "strapi::public",
];
