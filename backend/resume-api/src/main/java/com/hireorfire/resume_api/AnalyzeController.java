package com.hireorfire.resume_api;

import com.hireorfire.resume_api.dto.*;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
public class AnalyzeController {

    @PostMapping("/analyze")
    public AnalyzeResponse analyze(@RequestBody AnalyzeRequest request) {
        return new AnalyzeResponse(
            List.of(
                new JobAnalysis(
                    request.getJobs().get(0).getTitle(),
                    88,
                    List.of("Strong Java knowledge", "Good teamwork experience"),
                    List.of("Need more leadership experience"),
                    "Solid match for this role."
                )
            )
        );
    }
}
