const bool isProduction = true;

const String baseUrl = isProduction
    ? "https://sikomti.cloud/api" // Base URL untuk production
    : "http://10.0.2.2:8000/api"; // Base URL untuk development (localhost)
