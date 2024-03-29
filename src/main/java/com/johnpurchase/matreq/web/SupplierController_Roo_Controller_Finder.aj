// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.web;

import com.johnpurchase.matreq.model.MaterialDesc;
import com.johnpurchase.matreq.model.Supplier;
import java.lang.String;
import java.util.Set;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect SupplierController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByMaterialDescs", "form" }, method = RequestMethod.GET)
    public String SupplierController.findSuppliersByMaterialDescsForm(Model uiModel) {
        return "suppliers/findSuppliersByMaterialDescs";
    }
    
    @RequestMapping(params = "find=ByMaterialDescs", method = RequestMethod.GET)
    public String SupplierController.findSuppliersByMaterialDescs(@RequestParam("materialDescs") Set<MaterialDesc> materialDescs, Model uiModel) {
        uiModel.addAttribute("suppliers", Supplier.findSuppliersByMaterialDescs(materialDescs).getResultList());
        return "suppliers/list";
    }
    
}
