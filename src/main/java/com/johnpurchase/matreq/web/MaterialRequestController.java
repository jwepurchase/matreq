package com.johnpurchase.matreq.web;

import com.johnpurchase.matreq.model.MaterialRequest;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "materialrequests", formBackingObject = MaterialRequest.class)
@RequestMapping("/materialrequests")
@Controller
public class MaterialRequestController {
}
