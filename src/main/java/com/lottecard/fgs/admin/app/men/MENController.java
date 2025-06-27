package com.lottecard.fgs.admin.app.cmn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.lottecard.fgs.global.config.view.LayoutType;

import java.util.List;

@Controller
@RequestMapping(path="/men/")
public class MENController {

    @GetMapping("MENRGH001L1V")
    public String postList() {
        // return "postDetail";
        return LayoutType.MAIN.path();
    }

}
