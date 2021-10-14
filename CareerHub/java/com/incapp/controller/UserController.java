package com.incapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.incapp.beans.Job;
import com.incapp.beans.User;

@Controller
public class UserController {
	
	final static private String URL="http://localhost:7778/";
	RestTemplate restTemplate=new RestTemplate();
	
	@PostMapping("/UserRegister")
	public String UserRegister(@ModelAttribute User u,ModelMap m) {
		String API="/userRegister";
		HttpHeaders h=new HttpHeaders();
		HttpEntity<User> requestEntity=new HttpEntity(u,h);
		ResponseEntity<String> result=restTemplate.postForEntity(URL+API,requestEntity,String.class);
		m.addAttribute("result", result.getBody());
		return "index";
	}
	
	@PostMapping("/UserLogin")
	public String userLogin(String email,String password,ModelMap m,HttpSession session) {
		
		String API="/userLogin"+"/" + email+"/"+password;
		ResponseEntity<String[]> result=restTemplate.getForEntity(URL+API,String[].class);
		String r[]=result.getBody();
		if(r.length==0) {
			m.addAttribute("result", "Invalid Credentials!");
			return "index";
		}else {
			session.setAttribute("userEmail", r[0]);
			session.setAttribute("userName", r[1]);
			
			return "UserProfile";
		}
	}
	@PostMapping("/ResetPassword")
	public String ResetPassword(String email,ModelMap m) {
		String API="/resetPassword"+"/"+email;
		HttpHeaders h=new HttpHeaders();
		ResponseEntity<String> result=restTemplate.postForEntity(URL+API,h,String.class);
		m.addAttribute("result", result.getBody());
		return "index";
	}
	
	@PostMapping("/Apply")
	public String Apply(ModelMap m,HttpSession session) {
		String email=(String)session.getAttribute("userEmail");
		String API="/apply"+"/"+email;
		HttpHeaders h=new HttpHeaders();
		ResponseEntity<String> result=restTemplate.postForEntity(URL+API,h,String.class);
		m.addAttribute("result", result.getBody());
		
		return "index";
	}
	
	@RequestMapping("/UserJobs")
	public String userHome(ModelMap m,HttpSession session) {
		String email=(String)session.getAttribute("userEmail");
		if(email==null) {
			return "index";
		}
		return "UserJobs";
	}
	
	
	@RequestMapping("/UserProfile")
	public String UserProfile(ModelMap m,HttpSession session) {
		String email=(String)session.getAttribute("userEmail");
		if(email==null) {
			m.addAttribute("result", "Plz Login First");
			return "index";
		}
		return "UserProfile";
	}
	
		@PostMapping("/UserImageUpload")
		public String UserImageUpload(@RequestPart("photo") MultipartFile image,HttpSession session,ModelMap m) {
			String email=(String)session.getAttribute("userEmail");
			
			String API="/userImageUpload"+"/" + email;
			HttpHeaders h=new HttpHeaders();
			h.setContentType(MediaType.MULTIPART_FORM_DATA);
			
			LinkedMultiValueMap<String, Object> data=new LinkedMultiValueMap<>();
			
			data.add("photo", convert(image));
			
			HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity=new HttpEntity(data,h);
			
			
			ResponseEntity<String> result=restTemplate.postForEntity(URL+API,requestEntity,String.class);
			m.addAttribute("result", result.getBody());
			return "UserProfile";
		}
		
		public static FileSystemResource convert(MultipartFile file) {
			File convFile=new File(file.getOriginalFilename());
			try {
				convFile.createNewFile();
				FileOutputStream fos=new FileOutputStream(convFile);
				fos.write(file.getBytes());
				fos.close();
			}catch (IOException e) {
				e.printStackTrace();
			}
			return new FileSystemResource(convFile);
		}
		
		
		@RequestMapping("/getUserImage")
		public void getUserImage(String email,HttpServletResponse response) {
			try {
				String API="/getUserImage"+"/" + email;
				byte[] b=restTemplate.getForObject(URL+API,byte[].class);
				response.getOutputStream().write(b);
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
			@PostMapping("/UserResumeUpload")
				public String UserResumeUpload(@RequestPart("file") MultipartFile file,HttpSession session,ModelMap m) {
					String email=(String)session.getAttribute("userEmail");
					
					String API="/userResumeUpload"+"/" + email;
					HttpHeaders h=new HttpHeaders();
					h.setContentType(MediaType.MULTIPART_FORM_DATA);
					
					LinkedMultiValueMap<String, Object> data=new LinkedMultiValueMap<>();
					
					data.add("file", convert1(file));
					
					HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity=new HttpEntity(data,h);
					
					
					ResponseEntity<String> result=restTemplate.postForEntity(URL+API,requestEntity,String.class);
					m.addAttribute("result", result.getBody());
					return "UserProfile";
				}
				
				public static FileSystemResource convert1(MultipartFile file) {
					File convFile=new File(file.getOriginalFilename());
					try {
						convFile.createNewFile();
						FileOutputStream fos=new FileOutputStream(convFile);
						fos.write(file.getBytes());
						fos.close();
					}catch (IOException e) {
						e.printStackTrace();
					}
					return new FileSystemResource(convFile);
				}
				
}