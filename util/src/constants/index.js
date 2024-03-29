export const API_BASE_URL = "http://i8d210.p.ssafy.io:8081/api";
export const OAUTH_API_BASE_URL = "http://i8d210.p.ssafy.io:8081/api";
export const ACCESS_TOKEN = "accessToken";

export const TOKEN = () => {
  const token = localStorage.getItem("accessToken");
  return `Bearer ${token}`;
};

export const OAUTH2_REDIRECT_URI = "http://localhost:3000/oauth2/redirect";

export const GOOGLE_AUTH_URL =
  OAUTH_API_BASE_URL +
  "/oauth2/authorize/google?redirect_uri=" +
  OAUTH2_REDIRECT_URI;

export const KAKAO_AUTH_URL =
  OAUTH_API_BASE_URL +
  "/oauth2/authorize/kakao?redirect_uri=" +
  OAUTH2_REDIRECT_URI;
