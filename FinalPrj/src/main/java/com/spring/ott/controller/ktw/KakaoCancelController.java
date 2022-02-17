package com.spring.ott.controller.ktw;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.JsonObject;
import com.spring.ott.service.PayMentService;
import com.spring.ott.vo.PayMentVo;

@Controller
public class KakaoCancelController {
	@Autowired PayMentService service;
	
	@RequestMapping("/kakaoc")
	public ModelAndView list(Model model) {
		ModelAndView mv = new ModelAndView("kakaocancel.tiles");

		return mv;
	}
	
	//카카오페이 API 결제취소 부분
	@GetMapping("/kakaocancel")
	public @ResponseBody String taewoo(String tid, int cancel_amount) {
		
		try {
			
			URL url = new URL("https://kapi.kakao.com/v1/payment/cancel");
			
			//URL 연결(웹페이지 URL 연결)
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			// Request 헤더값 세팅 setRequestProperty(String key, String value)
			con.setRequestProperty("Authorization", "KakaoAK 4d0cce9ffe021fbe85fb685c696bd914");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			//OutputStream으로 POST 데이터를 넘겨주겠다는 옵션
			con.setDoOutput(true); 
			
			String param = "tid=" + tid + 
					"&cid=TC0ONETIME&cancel_amount=" + cancel_amount + "&cancel_tax_free_amount=0";
			

			OutputStream ops = con.getOutputStream();
			ops.write(param.getBytes("UTF-8"));
			ops.flush();
			ops.close();

			BufferedReader in =new BufferedReader(new InputStreamReader(con.getInputStream()));
			String msg = in.readLine();
			System.out.println("응답메세지 : " + msg);
			
			return "success";

		
		} catch (ProtocolException e1) {
			e1.printStackTrace();
			return "fail";
		} catch (MalformedURLException e1) {	
			e1.printStackTrace();
			return "fail";
		} catch (IOException e1) {
			e1.printStackTrace();
			return "fail";
		}finally {
			
		}
		
		
	}
	
	//결제 취소 성공후 이동할 페이지
	@GetMapping("/kakaocancelend")
	public String payend(String tid) {
		
		int a = service.payupdate(tid);
		System.out.println("결과 :" +a);
		return "redirect:/autoMatch/myParty";
	}

}


