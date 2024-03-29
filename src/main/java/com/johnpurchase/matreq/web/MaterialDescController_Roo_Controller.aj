// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.web;

import com.johnpurchase.matreq.model.MaterialDesc;
import com.johnpurchase.matreq.model.Supplier;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MaterialDescController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String MaterialDescController.create(@Valid MaterialDesc materialDesc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("materialDesc", materialDesc);
            return "materialdescs/create";
        }
        uiModel.asMap().clear();
        materialDesc.persist();
        return "redirect:/materialdescs/" + encodeUrlPathSegment(materialDesc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String MaterialDescController.createForm(Model uiModel) {
        uiModel.addAttribute("materialDesc", new MaterialDesc());
        return "materialdescs/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String MaterialDescController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("materialdesc", MaterialDesc.findMaterialDesc(id));
        uiModel.addAttribute("itemId", id);
        return "materialdescs/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String MaterialDescController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("materialdescs", MaterialDesc.findMaterialDescEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) MaterialDesc.countMaterialDescs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("materialdescs", MaterialDesc.findAllMaterialDescs());
        }
        return "materialdescs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String MaterialDescController.update(@Valid MaterialDesc materialDesc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("materialDesc", materialDesc);
            return "materialdescs/update";
        }
        uiModel.asMap().clear();
        materialDesc.merge();
        return "redirect:/materialdescs/" + encodeUrlPathSegment(materialDesc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String MaterialDescController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("materialDesc", MaterialDesc.findMaterialDesc(id));
        return "materialdescs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String MaterialDescController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MaterialDesc.findMaterialDesc(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/materialdescs";
    }
    
    @ModelAttribute("materialdescs")
    public Collection<MaterialDesc> MaterialDescController.populateMaterialDescs() {
        return MaterialDesc.findAllMaterialDescs();
    }
    
    @ModelAttribute("suppliers")
    public Collection<Supplier> MaterialDescController.populateSuppliers() {
        return Supplier.findAllSuppliers();
    }
    
    String MaterialDescController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
