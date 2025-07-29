package help.airo.service_airo.controller

import help.airo.service_airo.model.HealthStatus
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("status")
class HealthCheck {

    @GetMapping
    fun HealthStatus(): HealthStatus {
        return HealthStatus(status = "healthy")
    }
}