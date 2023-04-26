package fis.com.vn.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fis.com.vn.common.CommonUtils;
import fis.com.vn.exception.ErrorException;
import fis.com.vn.repository.UserInfoRepository;
import fis.com.vn.repository.UserModuleRepository;
import fis.com.vn.table.UserInfo;
import fis.com.vn.table.UserModule;

@Controller
public class DangNhapController extends BaseController {
	private static final Logger LOGGER = LoggerFactory.getLogger(DangNhapController.class);

	@Autowired
	UserInfoRepository userInfoRepository;
	@Autowired
	UserModuleRepository userModuleRepository;

	@GetMapping(value = "/login")
	public String get(Model model) {
		return "login";
	}

	@PostMapping(value = "/login")
	public String get(Model model, HttpServletRequest req, @RequestParam Map<String, String> allParams) {
		try {
			LOGGER.info("login" + new Date());
			UserInfo userInfo = userInfoRepository.findBySoCmt(getStringParams(allParams, "soCmt"));
			if (userInfo == null)
				throw new ErrorException("soCmt is incorrect");
			if (!userInfo.getPassword().equals(CommonUtils.getMD5(getStringParams(allParams, "password"))))
				throw new ErrorException("Password is incorrect");
			if (userInfo.getStatus() == null || (userInfo.getStatus() != null && userInfo.getStatus() != 1))
				throw new ErrorException("The account has not activated ");

			String[] groupIds = userInfo.getGroupId().split(",");

			List<UserModule> userModules = userModuleRepository.selectGroupId(groupIds);
			System.out.println("email user infor: " + userInfo.getEmail());
			req.getSession().setAttribute("userModuleMenus", userModules);
			req.getSession().setAttribute("username", userInfo.getUsername());
			req.getSession().setAttribute("fullName", userInfo.getFullName());
			req.getSession().setAttribute("emailUser", userInfo.getEmail());
			req.getSession().setAttribute("userid", userInfo.getId());
			req.getSession().setAttribute("khuVuc", userInfo.getKhuVuc());
			req.getSession().setAttribute("soCmt", userInfo.getSoCmt());

//            Cookie[] cookies = req.getCookies();
//
//            if (cookies != null) {
//             for (Cookie cookie : cookies) {
//               if (cookie.getName().equals("urlReferer")) {
//            	   return "redirect:"+cookie.getValue();
//                }
//              }
//            }

			return "redirect:/loan";
		} catch (ErrorException e) {
			model.addAttribute("message", e.getMessage());
			LOGGER.error(e.getMessage());
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			LOGGER.error("ErrorException", e);
		}
		return "/login";
	}

}
