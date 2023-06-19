package com.pointhome.www.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.pointhome.www.user.dao.face.UserDao;
import com.pointhome.www.user.dto.User;
import com.pointhome.www.user.dto.UserSocial;
import com.pointhome.www.user.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserDao userDao;
	
	@Override
	public void addUser(User user) {
		logger.debug( "회원가입 추가 성공[1] | 실패[0] => " + userDao.insertUser(user) );
	}

	@Override
	public Boolean isLogin(User param) {
		
		Boolean res = false;
		
		if( userDao.selectCntByUserEmailPw(param) > 0) {
			res = true;
			logger.debug("회원정보 존재 : {}", res);
		}
		
		return res;
	}

	@Override
	public User getUser(User param) {

		User user = new User();
		user = userDao.selectByUserEmailPw(param);

		return user;
	}

	@Override
	public String generateState() {

	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}

	@Override
	public Map<String, Object> getStateApiUrl() {

		Map<String, Object> map = new HashMap<>();
		
		String callbackURL = "http://localhost:8888/user/navercallback";
	    String clientId = "cUmMzSZPUu5v9OklWSqJ";//애플리케이션 클라이언트 아이디값";
	    
	    String redirectURI = null;
		try {
			redirectURI = URLEncoder.encode(callbackURL, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    
		SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString(32);
	    String apiURL = "";
	    apiURL += "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
		
        map.put("state", state);
        map.put("apiURL", apiURL);
		
        logger.debug("{}", map.put("apiURL", apiURL));
		return map;
	}

	@Override
	public String getApiURL(String code, String state) {

		String callbackURL = "http://localhost:8888/";
		String clientId = "cUmMzSZPUu5v9OklWSqJ";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "7us20334CP";//애플리케이션 클라이언트 시크릿값";
		String redirectURI = null;

		try {
			redirectURI = URLEncoder.encode(callbackURL, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String apiURL = "";
		apiURL += "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		
		return apiURL;
	}

	@Override
	public JsonObject getTokenNaver(String apiURL) {

		try {
			URL url = new URL(apiURL);
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			con.setRequestMethod("GET");
			
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			String res = "";;

			while ((inputLine = br.readLine()) != null) {
				res += inputLine;
			}

			br.close();

			if (responseCode == 200) {
				logger.debug("res : {}", res.toString());

				Gson gson = new Gson();

				JsonObject jsonObj = gson.fromJson(res, JsonObject.class);
				logger.debug("jsonObj : {}", jsonObj);

				return jsonObj;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public User getUserInfoNaver(JsonObject token) {
	
		  String host = "https://openapi.naver.com/v1/nid/me";
          
		  User user = new User();
          
          try {
        	  
              URL url = new URL(host);

              HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
              
              urlConnection.setRequestProperty("Authorization", "Bearer " + token.get("access_token"));
              urlConnection.setRequestMethod("GET");

              int responseCode = urlConnection.getResponseCode();
              logger.debug("responseCode : {} ", responseCode);

              BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
              logger.debug("br? {} :", br);
              
              String line = "";
              String res = "";
              
              while((line=br.readLine())!=null) {
                  res+=line;
              }

              logger.debug("res : {}", res);

              Gson gson = new Gson();
              
              JsonObject jsonObject = gson.fromJson(res, JsonObject.class);
              logger.debug("jsonObject : {}", jsonObject);
              
              JsonObject response = jsonObject.getAsJsonObject("response");
              logger.debug("response : {}", response);

              String email = response.get("email").getAsString().trim();
              String id = response.get("id").getAsString().trim();
              String name = response.get("name").getAsString().trim();
              String nickname = response.get("nickname").getAsString().trim();
              char gender = response.get("gender").getAsString().charAt(0);
              String phone = response.get("mobile").getAsString().replaceAll("[^0-9]", "").trim();
              int birthyear = response.get("birthyear").getAsInt();
              int birthmonth = Integer.parseInt(response.get("birthday").getAsString().split("-")[0]);
              int birthday = Integer.parseInt(response.get("birthday").getAsString().split("-")[1]);

              user.setUserEmail(email);
              user.setUserPw(id); // 최초 소셜로그인시, 소셜 고유ID를 Pw로 설정
              user.setUserName(name);
              user.setUserNick(nickname);
              user.setUserGender(gender);
              user.setUserPhone(phone);
              user.setUserBirthYear(birthyear);
              user.setUserBirthMonth(birthmonth);
              user.setUserBirthDay(birthday);
              
              br.close();

          } catch (IOException e) {
              e.printStackTrace();
          }
          
          logger.debug("user : {}", user);

          return user;
		
	}
	
	@Override
	public int getCntUserByEmailPhone(User userInfo) {
		int res = userDao.selectCntByUserEmailPhone(userInfo);
		logger.debug("res : {}", res);
		return res;
	}

	@Override
	public User getUserNoByEmailPhone(User userInfo) {
		
		return userDao.selectUserNoByEmailPhone(userInfo);
	}

	@Override
	public int getUserIndex() {
		return userDao.selectUserIndex();
	}
	@Override
	public void addUserSocial(UserSocial socialParam) {
		userDao.insertUserSocial(socialParam);
	}
	
	@Override
	public User getUserEmailByNamePhone(User param) {
		return userDao.selectUserEmailByNamePhone(param);
	}
	
	
	@Override
	public String getKakaoAccessToken (String code) {
		String access_Token = "";
		String refresh_Token = "";
		//토큰 발급 요청 주소 [POST] - http body에 데이터를 전달 
		String reqUrl = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			//해당 url에 POST로 정보를 넘겨주는 코드
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			//토큰을 발급받기 위한 정보 4개를 sb에 담는다
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=9bc229ac39da11c0c4922d0b6b945cad"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:8888/user/kakaocallback"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();
            
            int responseCode = conn.getResponseCode();
            logger.debug("response : {}",responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while((line = br.readLine()) != null) {
            	result += line;
            }
            
            logger.debug("response body : {} " , result);
            
            Gson gson = new Gson();
            
            JsonElement je = gson.fromJson(result, JsonElement.class);
            
            access_Token = je.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = je.getAsJsonObject().get("refresh_token").getAsString();
            
            logger.debug("oauthService() access_Token : " + access_Token);
            logger.debug("oauthService() refresh_Token : " + refresh_Token);
            
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return access_Token;
	}

	@Override
	public User getUserInfo (String access_Token) {
	    
	    // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    User userInfo = new User();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        logger.debug("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        logger.debug("response body : {}" + result);
	        
            Gson gson = new Gson();
	        
	        JsonObject element = gson.fromJson(result, JsonObject.class);
	        logger.debug(" 카카오에서 받아온 사용자 정보 : {}", element);	
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        logger.debug("properties :{}",properties);
	        		
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        logger.debug("kakao_account :{}",kakao_account);
	        
	        JsonObject profile = kakao_account.getAsJsonObject().get("profile").getAsJsonObject();
	        logger.debug("profile : {}",profile);
	        
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        String id = element.getAsJsonObject().get("id").getAsString();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String genderStr = kakao_account.getAsJsonObject().get("gender").getAsString();
	        char gender = genderStr.toUpperCase().charAt(0);
	        String birthMonthStr = kakao_account.getAsJsonObject().get("birthday").getAsString().substring(0,2);
	        int birthMonth = Integer.parseInt(birthMonthStr);
	        String birthDayStr = kakao_account.getAsJsonObject().get("birthday").getAsString().substring(2,4);
	        int birthDay = Integer.parseInt(birthDayStr);
	        
	        
	        userInfo.setUserEmail(email);
	        userInfo.setUserPw(id);
	        userInfo.setUserNick(nickname);
	        userInfo.setUserGender(gender);
	        userInfo.setUserBirthMonth(birthMonth);
	        userInfo.setUserBirthDay(birthDay);
	        
	        
	    } catch (IOException e) {
	    	
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
	
	@Override
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        logger.debug("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        
	    } catch (IOException e) {
	        
	    	e.printStackTrace();
	    
	    }
	}
	@Override
	public int getCntUserByEmail(User userInfo) {
		
		
		return userDao.selectCntUserByEmail(userInfo);
	}

	@Override
	public User getUserNo(User userInfo) {
		
		return userDao.selectUserNoByEmail(userInfo);
	}

	@Override
	public String requestToServer(String logoutURL, String headerStr) throws IOException {

		URL url = null;

		try {
			url = new URL(logoutURL);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

		HttpURLConnection con = (HttpURLConnection)url.openConnection();

		try {
			con.setRequestMethod("GET");
		} catch (ProtocolException e) {
			e.printStackTrace();
		}

		logger.debug("headerStr: {}", headerStr);
		if(headerStr != null && !headerStr.equals("") ) {
			con.setRequestProperty("Authorization", headerStr);
		}

		int responseCode = con.getResponseCode();
		logger.debug("responseCode : {}", responseCode);

		BufferedReader br = null;

		if(responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}

		String inputLine = "";
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if(responseCode==200) {
			String new_res=res.toString().replaceAll("&#39;", "");
			return new_res; 
		} else {
			return null;
		}

	}

	@Override
	public String createNaverLogoutURL(String accessToken) {

		String clientId = "cUmMzSZPUu5v9OklWSqJ";
		String clientSecret = "7us20334CP";

		String logoutURL = "";
		logoutURL += "https://nid.naver.com/oauth2.0/token";
		logoutURL += "?grant_type=delete";
		logoutURL += "&client_id=" + clientId;
		logoutURL += "&client_secret=" + clientSecret;
		logoutURL += "&access_token=" + accessToken;
		logoutURL += "&service_provider=NAVER";

		return logoutURL;
	}

	@Override
	public Map<String, Object> getUserByPhone(Map<String, Object> jsonData) {

		return userDao.selectUserByPhone(jsonData);
	}

	@Override
	public User getUserByEmailPhone(User param) {

		return userDao.selectUserNoByEmailPhone(param);
	}
	
	@Override
	public void changeUserPw(User changePwUser) {
		userDao.updateUserPw(changePwUser);
	}
}