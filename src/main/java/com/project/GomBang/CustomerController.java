package com.project.GomBang;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.GomBang.DAO.CustomerDAO;
import com.project.GomBang.DAO.EnterpriseDAO;
import com.project.GomBang.VO.Bookmark;
import com.project.GomBang.VO.Customer;
import com.project.GomBang.VO.CustomerComment;
import com.project.GomBang.VO.Customerboard;
import com.project.GomBang.VO.Enterprise;
import com.project.GomBang.VO.Image;
import com.project.GomBang.VO.Item;
import com.project.GomBang.VO.Reservation;
import com.project.GomBang.VO.SearchItem;
import com.project.GomBang.VO.Total;

@Controller
public class CustomerController {

     @Autowired
	 CustomerDAO dao;
     @Autowired
      EnterpriseDAO dao1;
     
     @RequestMapping(value="/goCustomerPage",method=RequestMethod.GET)
  	public String goCustomerPage() {
    	 
  		return "customer/customerHome";
  	}
     
     @RequestMapping(value="/customerSignupgo",method=RequestMethod.GET)
 	public String signupgo() {
 		
 		return "customer/customerSignupgo";
 	}
 	@RequestMapping(value="/customerSignup",method=RequestMethod.POST)
 	public String signup(Customer c,Model model,HttpSession session) {
 		
 		dao.signup(c);
 		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
 		return "index-14";
 	}
 	
 	@RequestMapping(value="/customerIDcheck",method=RequestMethod.GET)
 	public @ResponseBody String idcheck(String customer_id) {
 		ArrayList<Customer> list=dao.checkid();	
 		for (Customer customer : list) {
 			
 			if (customer_id.equals(customer.getCustomer_ID())) {
 				return "duplicated";
 			}
 		
 		}
 		return "success";
 	}
	
 	@RequestMapping(value="/customerLogin",method=RequestMethod.POST)	
	public String login(Customer c,Model model,HttpSession session, HttpServletRequest request
            , HttpServletResponse response) throws Exception {
		
		Customer cu=dao.login(c);
		System.out.println(cu);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		if(cu!=null) {
			session.setAttribute("customerLoginID",c.getCustomer_ID());
			session.setAttribute("customer",cu);
			popularlist=dao1.popularproperties();
	        model.addAttribute("popularlist",popularlist);
	        model.addAttribute("popularlista",popularlist.get(0));
	        model.addAttribute("popularlistb",popularlist.get(1));
	        model.addAttribute("popularlistc",popularlist.get(2));
	        model.addAttribute("popularlistd",popularlist.get(3));
			return "index-14";
		}else {
			model.addAttribute("message","???????????? ??????????????? ???????????????");
			//return "customer/customerLogingo";
			   response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('???????????? ??????????????? ???????????????.'); history.go(-1);</script>");
	            out.flush();
		}
		return "customer/customerLogingo";
		
	}
	@RequestMapping(value="/customerLogingo",method=RequestMethod.GET)
	public String logingo() {
		return "customer/customerLogingo";
	}
	
	@RequestMapping(value="/customerLogout",method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
        model.addAttribute("popularlista",popularlist.get(0));
        model.addAttribute("popularlistb",popularlist.get(1));
        model.addAttribute("popularlistc",popularlist.get(2));
        model.addAttribute("popularlistd",popularlist.get(3));
		return "index-14";
	}
	
	@RequestMapping(value="/customerModify",method=RequestMethod.POST)
	public  String modify(Customer c, HttpSession session, Model model) {
		/*String id=(String) session.getAttribute("customerLoginID");*/
	
	   try {
			int result = dao.modify(c);
			System.out.println(result);
			System.out.println(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
		
		return "index-14";
	}
	@RequestMapping(value="/customerDelete", method=RequestMethod.GET)
	public String withdraw(Customer c, HttpSession session, Model model) {
		String id = (String)session.getAttribute("customerLoginID");
		if (id==null) {
			return "customer/customerHome";
		}
		
		c.setCustomer_ID((String)session.getAttribute("customerLoginID"));
		dao.deleteID(c);
		session.setAttribute("customerLoginID", null);
		
		return "customer/customerHome";
	}
	
	//?????? ?????? ????????? ??????
	@RequestMapping(value = "/enterpriseListCheck", method = RequestMethod.GET)
	public String enterpriseListCheck(Model model) {
		ArrayList<Enterprise> eList = new ArrayList<Enterprise>();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		try {
			eList = dao.customerEnterpriseList();
			model.addAttribute("customerEnterpriseList", eList);
			popularlist=dao1.popularproperties();
	        model.addAttribute("popularlist",popularlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/enterpriseListCheck";
	}
	
	// ?????? ?????? ?????? ????????? ??????
	@RequestMapping(value = "/enterpriseDetailCheck", method = RequestMethod.GET)
	public String enterpriseDetailCheck(String enterprise_ID, Model model) {
		Enterprise enterprise = new Enterprise();
		try {
			enterprise = dao.customerEnterpriseDetail(enterprise_ID);
			model.addAttribute("customerEnterpriseDetail", enterprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/enterpriseDetailCheck";
	}
	
	//????????? ??????
		@RequestMapping(value="/goCustomerboard", method=RequestMethod.GET)
		public String goBoard(HttpSession session) {
			
			String LoginID = (String)session.getAttribute("customerLoginID");
			if (LoginID==null) {
				return "index-14";
			}
			
			return "redirect:/customerBoardlist";
		}
	
	//????????? ??????
	@RequestMapping(value="/insertCustomeritem", method=RequestMethod.POST)
	public @ResponseBody String insertCustomerboard(Customerboard cboard, Model model) {
		int result = 0;
		result = dao.insertCustomerboard(cboard);
		if (result == 0) {
			return "fail";
		}else {			
			return "success";
		}
	}
	
	//????????? ?????????
	@RequestMapping(value="/customerBoardlist", method= {RequestMethod.GET, RequestMethod.POST})
	public String customerBoardlist(Model model, Customerboard cboard) {
		ArrayList<Customerboard> result = null;
		ArrayList<Total> popularlist=new ArrayList<Total>();
		result = dao.customerBoardlist();
		if (result == null) {
			return "customer/customerBoardGo";
		}
		
		for(Customerboard cb:result) {
			
			
			String s = cb.getCustomerBoard_Content();
			Pattern pattern = Pattern.compile("(<img\\b|(?!^)\\G)[^>]*?\\b(src|width|height)=([\"']?)([^\"]*)\\3");
			Matcher matcher = pattern.matcher(s);
			while (matcher.find()){
			   cb.setCustomerBoard_Content(matcher.group(4));
			    System.out.println(matcher.group(4));
			} 
		}
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
		model.addAttribute("cbList", result);
		return "customer/customerBoardGo";
	}
	
	//????????? ??????
	@RequestMapping(value="/enterCustomerboard", method=RequestMethod.GET)
	public String selectCustomerboard(String customerBoard_Seq, Model model, CustomerComment CustomerComment) {
		try {
			Integer.parseInt(customerBoard_Seq);
		} catch (Exception e) {
			return "redirect:/customerBoardlist";
		}
		ArrayList<Total> popularlist=new ArrayList<Total>();
		Customerboard result = null;
		dao.countCustomerboard(customerBoard_Seq);
		result = dao.selectCustomerboard(customerBoard_Seq);
		if (result == null) {
			return "redirect:/customerBoardlist";
		}
		model.addAttribute("customerBoard", result);
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
				
		customerCommentList3(CustomerComment, model);
				
		return "customer/customerBoardDetail";
	}
	
	//????????? ???????????? ??? ??????, ?????? ????????????
	@RequestMapping(value="/goRemakecustomer", method=RequestMethod.GET)
	public String goRemakecustomer(String customerBoard_Seq, Model model, Customerboard cboard) {
		try {
			Integer.parseInt(customerBoard_Seq);
		} catch (Exception e) {
			return "redirect:/customer/selectedCustomerboard";
		}
		ArrayList<Total> popularlist=new ArrayList<Total>();
		Customerboard result = null;
		result = dao.selectCustomerboard(customerBoard_Seq);
		if (result == null) {
			return "redirect:/customer/selectedCustomerboard";
		}
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
		model.addAttribute("customerBoard", result);
		return "customer/remakeCustomerboard";
	}
	
	//????????? ??????
	@RequestMapping(value="/remakeCustomeritem", method=RequestMethod.POST)
	public @ResponseBody String remakeCustomeritem(Customerboard cboard) {
		int result = 0;
		result=dao.remakeCustomerboard(cboard);
		if (result==0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	// ?????? ????????????
	@RequestMapping(value="/customerItemDetail", method=RequestMethod.GET)
	public String customerItemDetail(Model model,int forSale_Seq) {
		Item item = null;
		item = dao.customerItemDetail(forSale_Seq);
		String seq = Integer.toString(forSale_Seq);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		dao.itemHitCountUp(seq);
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
		model.addAttribute("detailItem", item);
		return "customer/properties-details";
	}
	// ????????? ????????????
	@RequestMapping(value="/detailImg", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Image> detailImg(int forSale_Seq){
		ArrayList<Image> imagelist = new ArrayList<Image>();
		imagelist = dao.detailImg(forSale_Seq);
		return imagelist;
	}
	
	// ?????? ????????????
		@RequestMapping(value="/searchAllItem", method=RequestMethod.GET)
		public @ResponseBody ArrayList<Item> searchAllItem() {
			ArrayList<Item> list = null;
			ArrayList<Image> imagelist = new ArrayList<Image>();
			list = dao.searchAllItem();
			for (Item item : list) {
				imagelist = dao.detailImg(item.getForSale_Seq());
				item.setForSale_ETC(imagelist.get(0).getSaveName());
			}
			return list;
		}
		
		// ?????? ????????????
				@RequestMapping(value="/searchItem", method=RequestMethod.GET)
				public String searchItem(SearchItem item, Model model) {
					System.out.println(item);
					if(item.getGeoapi_cities().contains("???????????????????????????????????????")||item.getGeoapi_cities().contains("??????????????????????????????????????????")) {
						item.setGeoapi_cities("none");
					}
					if(item.getGeoapi_towns().contains("?????????????????????????????????")||item.getGeoapi_towns().equals("?????????????????????????????????")) {
						item.setGeoapi_towns("none");
					}
					if(item.getEnterprise_ID()==null) {
						item.setEnterprise_ID("");
					}
					System.out.println(item);
					ArrayList<String[]> optionList = new ArrayList<String[]>();
					ArrayList<Item> list = null;
					ArrayList<Image> imagelist = new ArrayList<Image>();
					ArrayList<Image> searchImgList = new ArrayList<Image>();
					ArrayList<ArrayList<Image>> threeImgList = new ArrayList<ArrayList<Image>>();
					ArrayList<Total> popularlist=new ArrayList<Total>();
					list = dao.searchItem(item);
					for (Item item2 : list) {
						imagelist = dao.detailImg(item2.getForSale_Seq());
						searchImgList.add(imagelist.get(0));
						threeImgList.add(imagelist);
						String[] optionArr = item2.getForSale_Option().split(",");
						optionList.add(optionArr);
					}
					model.addAttribute("PreviousSearchItem", item);
					model.addAttribute("optionList", optionList);
					model.addAttribute("searchItemList", list);
					model.addAttribute("searchImgList", searchImgList);
					model.addAttribute("threeImgList", threeImgList);
					popularlist=dao1.popularproperties();
			        model.addAttribute("popularlist",popularlist);
					/*return "customer/properties-list-rightside";*/
					return "customer/properties-list-rightside";
				}
		
		// ?????????????????? ?????? ?????? ?????????
		@RequestMapping(value="/searchItem3", method=RequestMethod.GET)
		public String searchItem3(Model model) {
			SearchItem item = new SearchItem("Property Status", "Property Types", "???????????????????????????????????????", "???????????????????????????????????????", "?????????????????????????????????", -1, 0, 0, 300000, "", null, null, null, null, null,null);
			if(item.getGeoapi_cities().contains("???????????????????????????????????????")||item.getGeoapi_cities().contains("??????????????????????????????????????????")) {
				item.setGeoapi_cities("none");
			}
			if(item.getGeoapi_towns().contains("?????????????????????????????????")||item.getGeoapi_towns().equals("?????????????????????????????????")) {
				item.setGeoapi_towns("none");
			}
			if(item.getEnterprise_ID()==null) {
				item.setEnterprise_ID("");
			}
			System.out.println(item);
			ArrayList<String[]> optionList = new ArrayList<String[]>();
			ArrayList<Item> list = null;
			ArrayList<Image> imagelist = new ArrayList<Image>();
			ArrayList<Image> searchImgList = new ArrayList<Image>();
			ArrayList<ArrayList<Image>> threeImgList = new ArrayList<ArrayList<Image>>();
			ArrayList<Total> popularlist=new ArrayList<Total>();
			list = dao.searchItem(item);
			for (Item item2 : list) {
				imagelist = dao.detailImg(item2.getForSale_Seq());
				searchImgList.add(imagelist.get(0));
				threeImgList.add(imagelist);
				String[] optionArr = item2.getForSale_Option().split(",");
				optionList.add(optionArr);
			}
			model.addAttribute("PreviousSearchItem", item);
			model.addAttribute("optionList", optionList);
			model.addAttribute("searchItemList", list);
			model.addAttribute("searchImgList", searchImgList);
			model.addAttribute("threeImgList", threeImgList);
			popularlist=dao1.popularproperties();
	        model.addAttribute("popularlist",popularlist);
			/*return "customer/properties-list-rightside";*/
			return "customer/properties-list-rightside";
		}
		
		// ?????? ???????????? ???????????????
				@RequestMapping(value="/searchItem2", method=RequestMethod.GET)
				public String searchItem2(SearchItem item, Model model) {
					if(item.getGeoapi_cities().contains("???????????????????????????????????????")||item.getGeoapi_cities().contains("??????????????????????????????????????????")) {
						item.setGeoapi_cities("none");
					}
					if(item.getGeoapi_towns().contains("?????????????????????????????????")||item.getGeoapi_towns().equals("?????????????????????????????????")) {
						item.setGeoapi_towns("none");
					}
					if(item.getEnterprise_ID()==null) {
						item.setEnterprise_ID("");
					}
					System.out.println(item);
					ArrayList<String[]> optionList = new ArrayList<String[]>();
					ArrayList<Item> list = null;
					ArrayList<Image> imagelist = new ArrayList<Image>();
					ArrayList<Image> searchImgList = new ArrayList<Image>();
					ArrayList<ArrayList<Image>> threeImgList = new ArrayList<ArrayList<Image>>();
					ArrayList<Total> popularlist=new ArrayList<Total>();
					list = dao.searchItem(item);
					for (Item item2 : list) {
						imagelist = dao.detailImg(item2.getForSale_Seq());
						searchImgList.add(imagelist.get(0));
						threeImgList.add(imagelist);
						String[] optionArr = item2.getForSale_Option().split(",");
						optionList.add(optionArr);
					}
					model.addAttribute("PreviousSearchItem", item);
					model.addAttribute("optionList", optionList);
					model.addAttribute("searchItemList", list);
					model.addAttribute("searchImgList", searchImgList);
					model.addAttribute("threeImgList", threeImgList);
					popularlist=dao1.popularproperties();
			        model.addAttribute("popularlist",popularlist);
					/*return "customer/properties-list-rightside";*/
					return "customer/lots";
				}
	
	//????????? ??????????????? ??????
	@RequestMapping(value="/makeCustomerboard", method=RequestMethod.GET)
	public String makeCustomerboard(CustomerComment CustomerComment, Model model) {
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
		return "customer/makeCustomerboard";
	}
	
	//?????? ?????? ??????
	@RequestMapping(value="/insertCustomerComment", method=RequestMethod.POST)
	public String inserCustomerComment(CustomerComment CustomerComment, Model model) {
		int result = 0;
		result = dao.insertCustomerComment(CustomerComment);
		ArrayList<Total> popularlist=new ArrayList<Total>();
		
		if (result == 0) {
			System.out.println("11111111");
			return "customer/customerBoardDetail";
		}

		customerCommentList2(CustomerComment, model);
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);

		return "customer/commentFragment";
	}
	
	//?????? ?????? ????????? ????????????
	public void customerCommentList2(CustomerComment CustomerComment, Model model) {
		ArrayList<CustomerComment> result = null;
		result = dao.customerCommentList(CustomerComment);
		if (result == null) {
			return;
		}
		model.addAttribute("customerCommentList2", result);
	}
	public void customerCommentList3(CustomerComment CustomerComment, Model model) {
		ArrayList<CustomerComment> result = null;
		result = dao.customerCommentList(CustomerComment);
		if (result == null) {
			return;
		}
		model.addAttribute("customerCommentList3", result);
	}
	
	//?????? ?????? ????????? ??????
	@RequestMapping(value="/customerCommentList", method=RequestMethod.GET)
	public String customerCommentList(CustomerComment CustomerComment, Model model) {
		ArrayList<CustomerComment> result2 = null;
		ArrayList<Total> popularlist=new ArrayList<Total>();
		
		result2 = dao.customerCommentList(CustomerComment);
		if (result2 == null) {
			return "customer/customerBoardDetail";
		}
		model.addAttribute("customerCommentList", result2);
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
        
		return "customer/commentFragment";
	}
	
	//?????? ????????? ??????
	@RequestMapping(value="/deleteCustomerboard", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteCustomerboard(Customerboard cboard) {
		int result = 0;
		result = dao.deleteCustomerboard(cboard);
		if (result == 0) {
			return "redirect:/customerBoardlist";
		}
		return "redirect:/customerBoardlist";
	}
	
	@RequestMapping(value="/goFullMap",method=RequestMethod.GET)
 	public String goFullMap(Model model) {
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
 		
 		return "customer/properties-map-full";
 	}
	
	//????????? ??????
	@RequestMapping(value = "/insertCustomerReservation", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody int insertCustomerReservation(Reservation reservation/*String reservation_Visa, String reservation_Guarantor, String enterprise_ID, String customer_ID, String forSale_Seq*/) {
		int result = 0;
		/*Reservation reservation = new Reservation();
		reservation.setReservation_Visa(reservation_Visa);
		reservation.setReservation_Guarantor(reservation_Guarantor);
		reservation.setEnterprise_ID(enterprise_ID);
		reservation.setCustomer_ID(customer_ID);
		reservation.setForSale_Seq(forSale_Seq);*/
		try {
			result = dao.insertCustomerReservation(reservation);
			System.out.println(result);
			System.out.println(reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//?????? ??????
	@RequestMapping(value ="/reservationCheck", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Reservation> reservationCheck(String customer_ID){
		ArrayList<Reservation> rList = new ArrayList<Reservation>();
		try {
			rList = dao.reservationCheck(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rList;
	}
	
	//?????? ??????
	@RequestMapping(value = "/customerBookmark", method = RequestMethod.POST)
	public @ResponseBody int customerBookmark(Bookmark bookmark) {
		int result = 0;
		try {
			result = dao.customerBookmark(bookmark);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//?????? ?????? ??????
	@RequestMapping(value = "/bookmarkCheck", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Bookmark> bookmarkCheck(String customer_ID){
		ArrayList<Bookmark> bList = new ArrayList<Bookmark>();
		try {
			bList = dao.bookmarkCheck(customer_ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
	
	//?????? ????????? ????????? ??????
	@RequestMapping(value = "/customerMyProfile", method = RequestMethod.GET)
	public String customerMyProfile(String customer_ID, Model model) {
		Customer c = new Customer();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		
		try {
			c = dao.customerProfile(customer_ID);
			model.addAttribute("customerProfile", c);
			popularlist=dao1.popularproperties();
	        model.addAttribute("popularlist",popularlist);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "customer/customerMyProfile";
	}
	
	//????????? ???????????? ???????????? ??????
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
	public String profileUpdate(Customer customer, String customer_ID, Model model) {
		int result = 0;
		Customer c = new Customer();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		try {
			result = dao.profileUpdate(customer);
			if (result == 1) {
				c = dao.customerProfile(customer_ID);
				model.addAttribute("customerProfile", c);
				popularlist=dao1.popularproperties();
		        model.addAttribute("popularlist",popularlist);
				return "customer/customerMyProfile";
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//????????? ?????? - ???????????? ???????????? ??????
	@RequestMapping(value = "/profilePassword", method = RequestMethod.GET)
	public String profliePassword(Model model) {
		ArrayList<Total> popularlist=new ArrayList<Total>();
		popularlist=dao1.popularproperties();
        model.addAttribute("popularlist",popularlist);
        
		return "customer/customerProfilePassword";
	}
	
	//????????????????????? ???????????? ??????
	@RequestMapping(value = "/profilePasswordUpdate", method = RequestMethod.POST)
	public String profilePasswordUpdate(Customer customer,String customer_ID, Model model,HttpSession session) {
		int result = 0;
		Customer c = new Customer();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		
		try {
			result = dao.profilePasswordUpdate(customer);
			if (result == 1) {
				c = dao.customerProfile(customer_ID);
				session.setAttribute("customer", c);
				model.addAttribute("customerProfile", c);
				popularlist=dao1.popularproperties();
		        model.addAttribute("popularlist",popularlist);
				return "customer/customerMyProfile";
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//????????? ???????????? ?????? ????????? ???????????? ????????????
	@RequestMapping(value = "/favoritedList", method = RequestMethod.GET)
	public String favoritedList(String customer_ID, Model model) {
		ArrayList<Total> tList = new ArrayList<Total>();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		
		try {
			tList = dao.customerBookmarkList(customer_ID);
			model.addAttribute("customerBookmarkList", tList);
			popularlist=dao1.popularproperties();
	        model.addAttribute("popularlist",popularlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/customerFavoritedList";
	}
	
	//????????? ???????????? ?????? ????????? ???????????? ????????????
	@RequestMapping(value = "/reservationList", method = RequestMethod.GET)
	public String reservationList(String customer_ID, Model model) {
		ArrayList<Total> tList = new ArrayList<Total>();
		ArrayList<Total> popularlist=new ArrayList<Total>();
		try {
			tList = dao.customerReservationList(customer_ID);
			model.addAttribute("customerReservationList", tList);
			popularlist=dao1.popularproperties();
	        model.addAttribute("popularlist",popularlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/customerReservationList";
	}
	
	//????????? ?????? ??????
	@RequestMapping(value = "/customerDeleteBookmark", method = RequestMethod.POST)
	public @ResponseBody int customerDeleteBookmark(String bookmark_Seq) {
		int result = 0;
		try {
			result = dao.customerDeleteBookmark(bookmark_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//????????? ?????? ??????(??????)
	@RequestMapping(value = "/customerDeleteReservation", method = RequestMethod.POST)
	public @ResponseBody int customerDeleteReservation(String reservation_Seq) {
		int result = 0;
		try {
			result = dao.customerDeleteReservation(reservation_Seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}