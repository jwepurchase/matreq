package com.johnpurchase.matreq.web;

import com.johnpurchase.matreq.model.Supplier;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "suppliers", formBackingObject = Supplier.class)
@RequestMapping("/suppliers")
@Controller
public class SupplierController {
}
