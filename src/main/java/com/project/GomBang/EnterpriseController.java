package com.project.GomBang;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.GomBang.DAO.EnterpriseDAO;
import com.project.GomBang.VO.Customer;
import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Enterprise;
import com.project.GomBang.VO.EnterpriseBoard;
import com.project.GomBang.VO.EnterpriseComment;
import com.project.GomBang.VO.Image;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.Total;

@Controller
public class EnterpriseController {
	
	@Autowired
	EnterpriseDAO dao;
	
	ArrayList<Image> imgList = new ArrayList<Image>();
	 @RequestMapping(value="/goEnterprisePage",method=RequestMethod.GET)
	 public String goEnterprisePage() {
	  		
	  return "enterprise/enterpriseLogingo";
	}
	     
	@RequestMapping(value="/goSignup", method=RequestMethod.GET)
	public String goSignup() {
		
		return "enterprise/goEnterprisesignup";
	}
	@RequestMapping(value="/goUpdate", method=RequestMethod.GET)
	public String goUpdate(Enterprise enterprise, String enterprise_ID, String PW, String Name, String Address, String RegiNum, String ManagerName, 
			String ManagerPhone, String ManagerEmail, String ETC, String Code, Model model) {
		
		Enterprise result = dao.searchUpdate(enterprise_ID);
		if (result == null) {
			return "index-14";
		}
		model.addAttribute("Enterprise", result);
        
		System.out.println(enterprise_ID);
		
		return "enterprise/goEnterprisesignup";
	}
	@RequestMapping(value="/insertEnterprise", method=RequestMethod.POST)
	public String insertEnterprise(Enterprise enterprise) {
		
		int result = 0;
		result = dao.insertEnterprise(enterprise);
		if (result == 0) {
			return "enterprise/enterpriseSignup";
		}

		return "index-14";
	}
	@RequestMapping(value="/enterpriseLogin", method=RequestMethod.POST)
	public String login(Enterprise enterprise, HttpSession session, Model model) {
		
		Enterprise result = null;
		result = dao.selectEnterprise(enterprise);
		System.out.println(result);
		if (result == null) {
			model.addAttribute("warning", "Id??? Passworde??? ??????????????????.");
			return "enterprise/enterpriseLogingo";
		}
		if (result.getEnterprise_Permission().equals("Y")) {
			session.setAttribute("enterpriseLoginID", result.getEnterprise_ID());
			session.setAttribute("enterprise",result);
		} else if(result.getEnterprise_Permission().equals("W")){
			model.addAttribute("wait", "???????????? ??????????????????.");
		} else {
			model.addAttribute("deny", "????????? ?????????????????????. ??????????????? ???????????????.");
		}
		
		return "index-14";
	}
	@RequestMapping(value="/enterpriseLogout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("enterpriseLoginID");
		if (loginId == null) {
			return "customer/customerHome";
		}
		session.invalidate();
		
		return "index-14";
	}
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	public @ResponseBody String checkId(String id, HttpSession session) {
		ArrayList<Enterprise> enterpriseList = dao.enterpriseList();
		
		for (Enterprise enter : enterpriseList) {
			if (enter.getEnterprise_ID().equals(id)) {
				if (session.getAttribute("enterpriseLoginID")==null) {
					return "duplicated";
				}
			}
		}
		if(id.length()<6 || id.length()>14) {
			return "fail";
		}else {
			return "success";
		}
	}
	@RequestMapping(value="/withdraw", method=RequestMethod.POST)
	public String withdraw(Enterprise enterprise, HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("enterpriseLoginID");
		if (loginId==null) {
			return "enterprise/enterpriseHome";
		}
		
		enterprise.setEnterprise_ID((String)session.getAttribute("loginId"));
		dao.deleteEnterprise(enterprise);
		session.setAttribute("loginId", null);
		return "index-14";
	}
	@RequestMapping(value="/updateEnterprise", method=RequestMethod.POST)
	public String update(Enterprise enterprise, HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("enterpriseLoginID");
		if (loginId==null) {
			return "enterprise/enterpriseLogingo";
		}
		
		int result = 0;
		result = dao.updateEnterprise(enterprise);
		if (result == 0) {
			return "enterprise/goEnterprisesignup";
		}
		
		model.addAttribute("ID", enterprise.getEnterprise_ID());
		model.addAttribute("PW", enterprise.getEnterprise_PW());
		model.addAttribute("Name", enterprise.getEnterprise_Name());
		model.addAttribute("Address", enterprise.getEnterprise_Address());
		model.addAttribute("RegiNum", enterprise.getEnterprise_RegiNum());
		model.addAttribute("ManagerName", enterprise.getEnterprise_ManagerName());
		model.addAttribute("ManagerPhone", enterprise.getEnterprise_ManagerPhone());
		model.addAttribute("ManagerEmail", enterprise.getEnterprise_ManagerEmail());
		model.addAttribute("ETC", enterprise.getEnterprise_ETC());
		model.addAttribute("Code", enterprise.getEnterprise_Code());
		
		
		return "index-14";
	}
	@RequestMapping(value="/searchUpdate", method=RequestMethod.GET)
	public @ResponseBody Enterprise searchUpdate(String enterprise_ID) {
		Enterprise result = null;
		result = dao.searchUpdate(enterprise_ID);
		return result;
	}
	
	// ???????????? ????????? ??????
	@RequestMapping(value="/goInsertItem", method=RequestMethod.GET)
	public String goInsertItem() {
		return "enterprise/insertItem";
	}
	// ???????????? ????????? ??????
	@RequestMapping(value="/submitProperty", method=RequestMethod.GET)
	public String submitProperty(Model model) {
		imgList = new ArrayList<Image>();
		return "enterprise/submit-property";
	}
	// ?????? ????????????
	@RequestMapping(value="/insertItem", method= {RequestMethod.POST,RequestMethod.GET} )
	public String insertItem(Item item,HttpSession session) {
		System.out.println("???????????? ??????");
		String userid = (String) session.getAttribute("enterpriseLoginID");
		item.setEnterprise_ID(userid);
		System.out.println(item);
		dao.insertItem(item);
		System.out.println(item.getForSale_Seq());
		for (Image image : imgList) {
			image.setForSale_Seq(item.getForSale_Seq());
			dao.insertImg(image);
		}
		return "redirect:/";
	}
	
	
	
	@RequestMapping(value = "/file-upload")
	public @ResponseBody void requestupload2(MultipartHttpServletRequest upload) {
		System.out.println("??????");
		
		List<MultipartFile> fileList = upload.getFiles("file");
		String path = "C:\\Users\\SIM\\Documents\\test\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // ?????? ?????? ???
			
			String safeFile = path + System.currentTimeMillis() + originFileName;
			System.out.println("originFileName : " + originFileName);
			System.out.println("FileName : " + safeFile);
			Image img = new Image();
			img.setOriginName(originFileName);
			img.setSaveName(System.currentTimeMillis() + originFileName);
			try {
				mf.transferTo(new File(safeFile));
				System.out.println(img);
				imgList.add(img);
				System.out.println(imgList.size());
				System.out.println("??????");
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	@RequestMapping(value="/ICList",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Total> alllist(){
	 
		ArrayList<Total> list=new ArrayList<Total>();
		list=dao.ICList();
		return list;
		
	}
	
	@RequestMapping(value="/HouseTypeList",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Total> typelist(String forSale_HouseType){
	
		ArrayList<Total> typelist=new ArrayList<Total>();
		typelist=dao.HouseTypeList(forSale_HouseType);
		return typelist;
		
	}
	
	//????????? ??????
	@RequestMapping(value="/goEnterpriseboard", method=RequestMethod.GET)
	public String goBoard(HttpSession session) {
		
		String LoginID = (String)session.getAttribute("enterpriseLoginID");
		if (LoginID==null) {
			return "index-14";		}
		
		return "redirect:/enterpriseBoardlist";
	}
	
	//????????? ??????
	@RequestMapping(value="/insertEnterpriseitem", method=RequestMethod.POST)
	public @ResponseBody String insertEnterpriseitem(EnterpriseBoard enterpriseboard, Model model) {
		int result = 0;
		result = dao.insertEnterpriseBoard(enterpriseboard);
		if (result == 0) {
			return "fail";
		}else {			
			return "success";
		}
	}
	
	//????????? ?????????
	@RequestMapping(value="/enterpriseBoardlist", method= {RequestMethod.GET, RequestMethod.POST})
	public String enterpriseBoardlist(Model model, EnterpriseBoard enterpriseboard) {
		ArrayList<EnterpriseBoard> result = null;
		result = dao.enterpriseBoardList();
		if (result == null) {
			return "enterprise/enterpriseBoardGo";
		}
		
		for(EnterpriseBoard eb:result) {
			
			
			String s = eb.getEnterpriseBoard_Content();
			Pattern pattern = Pattern.compile("(<img\\b|(?!^)\\G)[^>]*?\\b(src|width|height)=([\"']?)([^\"]*)\\3");
			Matcher matcher = pattern.matcher(s);
			while (matcher.find()){
			   eb.setEnterpriseBoard_Content(matcher.group(4));
			    System.out.println(matcher.group(4));
			} 
		}
		
		model.addAttribute("ebList", result);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/enterpriseBoardGo";
	}
	
	//????????? ??????
	@RequestMapping(value="/enterEnterpriseboard", method=RequestMethod.GET)
	public String selectEnterpriseboard(String enterpriseBoard_Seq, Model model, EnterpriseComment EnterpriseComment) {
		try {
			Integer.parseInt(enterpriseBoard_Seq);
		} catch (Exception e) {
			return "redirect:/enterpriseBoardlist";
		}
		EnterpriseBoard result = null;
		dao.countEnterpriseboard(enterpriseBoard_Seq);
		result = dao.selectEnterpriseboard(enterpriseBoard_Seq);
		if (result == null) {
			return "redirect:/enterpriseBoardlist";
		}
		model.addAttribute("enterpriseBoard", result);
						
		enterpriseCommentList3(EnterpriseComment, model);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
						
		return "enterprise/enterpriseBoardDetail";
	}
			
	//????????? ???????????? ??? ??????, ?????? ????????????
	@RequestMapping(value="/goRemakeenterprise", method=RequestMethod.GET)
	public String goRemakeenterprise(String enterpriseBoard_Seq, Model model, EnterpriseBoard eboard) {
		try {
			Integer.parseInt(enterpriseBoard_Seq);
		} catch (Exception e) {
			return "redirect:/enterprise/selectedEnterpriseboard";
		}
		EnterpriseBoard result = null;
		result = dao.selectEnterpriseboard(enterpriseBoard_Seq);
		if (result == null) {
			return "redirect:/enterprise/selectedEnterpriseboard";
		}
		model.addAttribute("enterpriseBoard", result);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/remakeEnterpriseboard";
	}
			
	//????????? ??????
	@RequestMapping(value="/remakeEnterpriseboard", method=RequestMethod.POST)
	public @ResponseBody String remakeEnterpriseboard(EnterpriseBoard eboard,Model model) {
		int result = 0;
		result=dao.remakeEnterpriseboard(eboard);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		if (result==0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	//????????? ??????????????? ??????
	@RequestMapping(value="/makeEnterpriseboard", method=RequestMethod.GET)
	public String makeEnterpriseboard(EnterpriseComment EnterpriseComment, Model model) {
				
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/makeEnterpriseboard";
	}
			
	//?????? ?????? ??????
	@RequestMapping(value="/insertEnterpriseComment", method=RequestMethod.POST)
	public String insertEnterpriseComment(EnterpriseComment EnterpriseComment, Model model) {
		int result = 0;
		result = dao.insertEnterpriseComment(EnterpriseComment);
		if (result == 0) {
			System.out.println("11111111");
			return "enterprise/enterpriseBoardDetail";
		}

		enterpriseCommentList2(EnterpriseComment, model);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);

		return "enterprise/commentFragment";
	}
			
	//?????? ?????? ????????? ????????????
	public void enterpriseCommentList2(EnterpriseComment EnterpriseComment, Model model) {
		ArrayList<EnterpriseComment> result = null;
		result = dao.enterpriseCommentList(EnterpriseComment);
		if (result == null) {
			return;
		}
		model.addAttribute("enterpriseCommentList2", result);
	}
	public void enterpriseCommentList3(EnterpriseComment EnterpriseComment, Model model) {
		ArrayList<EnterpriseComment> result = null;
		result = dao.enterpriseCommentList(EnterpriseComment);
		if (result == null) {
			return;
		}
		model.addAttribute("enterpriseCommentList3", result);
	}
			
	//?????? ?????? ????????? ??????
	@RequestMapping(value="/enterpriseCommentList", method=RequestMethod.GET)
	public String enterpriseCommentList(EnterpriseComment EnterpriseComment, Model model) {
		ArrayList<EnterpriseComment> result2 = null;
		result2 = dao.enterpriseCommentList(EnterpriseComment);
		if (result2 == null) {
			return "enterprise/enterpriseBoardDetail";
		}
		model.addAttribute("enterpriseCommentList", result2);
		return "enterprise/commentFragment";
	}
			
	//?????? ????????? ??????
	@RequestMapping(value="/deleteEnterpriseboard", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteEnterpriseboard(EnterpriseBoard eboard) {
		int result = 0;
		result = dao.deleteEnterpriseboard(eboard);
		if (result == 0) {
			return "redirect:/enterpriseBoardlist";
		}
		return "redirect:/enterpriseBoardlist";
	}
	//?????? ????????? ????????? ?????? ????????????
	@RequestMapping(value="/myproperties", method=RequestMethod.GET)
	public String myproperties(Model model,HttpSession session) {
					
		String userid = (String) session.getAttribute("enterpriseLoginID");
		Total total=new Total();
	    total.setEnterprise_ID(userid);
		ArrayList<Total> enterItemList=dao.EnterpriseItemList(total);
		model.addAttribute("enterItemList",enterItemList);
	    return "enterprise/my-properties";
	}
		//?????? ????????? ????????? ?????? ????????????
	@RequestMapping(value="/deleteEnterpriseItem", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteCustomerboard(Total total) {
		int result = 0;
		int result2 =0;
		result=dao.EnterpriseItemDelete(total);
		result2=dao.EnterpriseImageDelete(total);
		if (result == 0 && result2==0) {
			return "redirect:/myproperties";
		}
			return "redirect:/myproperties";
	}
		
	//?????? ?????? ??????????????? ??????
	@RequestMapping(value="/remakesubmitproperty", method={RequestMethod.POST, RequestMethod.GET})
	public String EnterpriseItem(Total tt, Model model) {
		Total total = null;
		ArrayList<Total> total2=new ArrayList<Total>();
		total=dao.EnterpriseItem(tt);
		total2=dao.EnterpriseImage(tt);
		if (total==null && total2==null) {
			return "redirect:/myproperties";
		}
		model.addAttribute("enterItem",total);
		model.addAttribute("enterImage",total2);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "enterprise/remake-submit-property";
	}
	//?????? ?????? ??????		
	@RequestMapping(value="/updateItem",method={RequestMethod.POST,RequestMethod.GET})
	public  String modify(Item item) {
		 int result = 0;
		 result=dao.updateItem(item);
		 System.out.println(dao.updateItem(item));
		 for (Image image : imgList) {
			image.setForSale_Seq(item.getForSale_Seq());
			dao.updateImage(image);
		}
		return "redirect:/myproperties";
	}
	
	//?????? ????????? ????????? ??????
	@RequestMapping(value = "/enterpriseMyProfile", method = RequestMethod.GET)
	public String customerMyProfile(Model model,HttpSession session) {
		Enterprise enterprise=new Enterprise();
		String userid = (String)session.getAttribute("enterpriseLoginID");
		enterprise=dao.enterpriseProfile(userid);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
		model.addAttribute("popularlist",popularlist);
		model.addAttribute("enter",enterprise);
		return "enterprise/enterpriseMyProfile";
	}
		
	//????????? ????????????
	@RequestMapping(value = "/updateenterpriseProfile", method={RequestMethod.POST,RequestMethod.GET})
	public String updateenterpriseProfile(Enterprise enterprise) {
		int result=0;
		result=dao.updateenterpriseProfile(enterprise);
		return "redirect:/enterpriseMyProfile";
	}	
		
	//????????? ?????? - ???????????? ???????????? ??????
	@RequestMapping(value = "/goprofilepassword", method = RequestMethod.GET)
	public String profliePassword(Model model) {
		return "enterprise/enterpriseProfilePassword";
	}
	
	//????????????????????? ???????????? ??????
	@RequestMapping(value = "/updateenterprisePassword", method={RequestMethod.POST,RequestMethod.GET})
	public String updateenterprisePassword(Enterprise enterprise,HttpSession session,Model model) {
		int result=0;
		result=dao.updateenterprisePassword(enterprise);
		session.setAttribute("enterprise",enterprise);
		return "redirect:/enterpriseMyProfile";
	}	
		
	//????????? ????????? ?????????  ????????? ?????? ???????????? ??? ??????
	@RequestMapping(value = "/reservationwait", method={RequestMethod.POST,RequestMethod.GET})
	public String reservationwait(HttpSession session,Model model) {
		String userid = (String) session.getAttribute("enterpriseLoginID");
		Total total=new Total();
		total.setEnterprise_ID(userid);
		ArrayList<Total> reservationlist=dao.reservationwait(total);
		model.addAttribute("reservationlist",reservationlist);
		return "enterprise/reservation-wait";
	}
		
	// ?????? ??????????????? ??????????????? ????????????	
	@RequestMapping(value = "/updatereservation", method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody String updatereservation(String reservation_Seq,Model model){
		int result=0;
		result=dao.updatereservation(reservation_Seq);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "redirect:/enterpriseMyProfile";
	}	
	
	//????????? ????????? ?????????  ????????? ?????? ?????? ??????
	@RequestMapping(value = "/reservationcomplete", method={RequestMethod.POST,RequestMethod.GET})
	public String reservationcomplete(HttpSession session,Model model) {
		String userid = (String) session.getAttribute("enterpriseLoginID");
		Total total=new Total();
		total.setEnterprise_ID(userid);
		ArrayList<Total> completelist=dao.reservationcomplete(total);
		model.addAttribute("completelist",completelist);
		return "enterprise/reservation-complete";
	}	
		
	//????????? ?????? ??????
	@RequestMapping(value = "/enterpriseReservationCancel", method = RequestMethod.POST)
	public @ResponseBody int enterpriseReservationCancel(Reservation reservation) {
		int result = 0;
		try {
			result = dao.enterpriseReservationCancel(reservation);
			System.out.println(reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//?????? --> ?????? ?????? ?????? ??????
	@RequestMapping(value = "/tradeComplete", method = RequestMethod.POST)
	public @ResponseBody int tradeComplete(Reservation reservation) {
		int result = 0;
		int result2 = 0;
		try {
			result2 = dao.tradeReservationCancel(reservation);
			result = dao.tradeComplete(reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//?????? ?????? ????????? ????????? ??????
	@RequestMapping(value = "/tradeCompleteList", method = RequestMethod.GET)
	public String tradeCompleteList(String enterprise_ID, Model model) {
		ArrayList<Total> tList = new ArrayList<Total>();
		try {
			tList = dao.tradeCompleteList(enterprise_ID);
			for (Total t : tList) {
				System.out.println(t);
			}
			model.addAttribute("tradeList", tList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "enterprise/tradeCompleteList";
	}
	
}
