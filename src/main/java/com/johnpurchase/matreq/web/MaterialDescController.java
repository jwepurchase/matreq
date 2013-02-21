package com.johnpurchase.matreq.web;

import com.johnpurchase.matreq.model.MaterialDesc;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "materialdescs", formBackingObject = MaterialDesc.class)
@RequestMapping("/materialdescs")
@Controller
public class MaterialDescController {
}
