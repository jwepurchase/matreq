package com.johnpurchase.matreq.web;

import com.johnpurchase.matreq.model.Purchaser;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "purchasers", formBackingObject = Purchaser.class)
@RequestMapping("/purchasers")
@Controller
public class PurchaserController {
}
