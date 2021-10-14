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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.incapp.beans.Company;
import com.incapp.beans.Job;

@Controller
public class CompanyController {
	
	final static private String URL="http://localhost:7778/";
	RestTemplate restTemplate=new RestTemplate();
	
	@GetMapping("/")
	public String home() {
		return "index";
	}

	@RequestMapping("/Logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("/Company")
	public String company() {
		return "Company";
	}
	
	@PostMapping("/CompanyRegister")
	public String CompanyRegister(@ModelAttribute Company c,ModelMap m) {
		String API="/companyRegister";
		HttpHeaders h=new HttpHeaders();
		HttpEntity<Company> requestEntity=new HttpEntity(c,h);
		ResponseEntity<String> result=restTemplate.postForEntity(URL+API,requestEntity,String.class);
		m.addAttribute("result", result.getBody());
		return "Company";
	}
	
	
	@PostMapping("/CompanyLogin")
	public String companyLogin(String email,String password,ModelMap m,HttpSession session) {
		
		String API="/companyLogin"+"/" + email+"/"+password;
		ResponseEntity<String[]> result=restTemplate.getForEntity(URL+API,String[].class);
		String r[]=result.getBody();
		if(r.length==0) {
			m.addAttribute("result", "Invalid Credentials!");
			return "Company";
		}else {
			session.setAttribute("companyEmail", r[0]);
			session.setAttribute("companyName", r[1]);
				return "companyHome";
			}
		}
	
	
	@PostMapping("/addJob")
	public String addJob(@ModelAttribute Job j,ModelMap m,HttpSession session) {
		String API="/addJob";
		HttpHeaders h=new HttpHeaders();
		HttpEntity<Company> requestEntity=new HttpEntity(j,h);
		ResponseEntity<String> result=restTemplate.postForEntity(URL+API,requestEntity,String.class);
		m.addAttribute("result", result.getBody());
		
		String email=(String)session.getAttribute("companyEmail");
		if(email==null) {
			return "Company";
		}
		else {
			return "companyHome";
		}
	}
	
	
	@RequestMapping("/companyHome")
	public String companyHome(ModelMap m,HttpSession session) {
		String email=(String)session.getAttribute("companyEmail");
		if(email==null) {
			return "Company";
		}
	else {
			return "companyHome";
		}
	}
	
	@RequestMapping("/ViewAllJobs")
	public String getJobs(ModelMap m,HttpSession session) {
		String email=(String)session.getAttribute("companyEmail");
		if(email==null) {
			return "Company";
		}
		String API="/getJobs"+"/" + email;
		Job[] jobs=restTemplate.getForObject(URL+API,Job[].class);
		m.addAttribute("jobs", jobs);
		return "ViewAllJobs";
	}
	
	@RequestMapping("/SearchJob")
	public String SearchJob(String category,ModelMap m,HttpSession session) {
		String email=(String)session.getAttribute("companyEmail");
		String API="/getJobsByCategory"+"/" + category;
		Job[] jobs=restTemplate.getForObject(URL+API,Job[].class);
		m.addAttribute("jobs", jobs);
		return "SearchJob";
	}
	
	@RequestMapping("/CompanyProfile")
	public String CompanyProfile(HttpSession session) {
		String email=(String)session.getAttribute("companyEmail");
		if(email==null) {
			return "Company";
		}
		return "CompanyProfile";
	}
	
	@PostMapping("/ImageUpload")
	public String ImageUpload(@RequestPart("logo") MultipartFile image,HttpSession session,ModelMap m) {
		String email=(String)session.getAttribute("companyEmail");
		
		String API="/companyLogoUpload"+"/" + email;
		HttpHeaders h=new HttpHeaders();
		h.setContentType(MediaType.MULTIPART_FORM_DATA);
		
		LinkedMultiValueMap<String, Object> data=new LinkedMultiValueMap<>();
		
		data.add("logo", convert(image));
		
		HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity=new HttpEntity(data,h);
		
		
		ResponseEntity<String> result=restTemplate.postForEntity(URL+API,requestEntity,String.class);
		m.addAttribute("result", result.getBody());
		return "CompanyProfile";
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
	
	@RequestMapping("/getImage")
	public void getImage(String email,HttpServletResponse response) {
		try {
			String API="/getImage"+"/" + email;
			byte[] b=restTemplate.getForObject(URL+API,byte[].class);
			response.getOutputStream().write(b);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
}