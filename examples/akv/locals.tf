locals {
    convention = "random"
    name = "caftestakv"
    location = "southeastasia"
    prefix = ""
    resource_groups = {
        test = { 
            name     = "test-caf-azfw"
            location = "southeastasia" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "CAF"
    }
    solution_plan_map = {
        NetworkMonitoring = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/NetworkMonitoring"
        },
    }

    akv_config = {
        name       = "monakv"

        akv_features = {
            enabled_for_disk_encryption = true
            enabled_for_deployment      = false
            enabled_for_template_deployment = true 
        }
        sku_name = "premium"
        # network_acls = {
        #     bypass = "AzureServices"
        #     default_action = "Deny"
        # }
        
        diagnostics_settings = {
        log = [
                    # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                    ["AuditEvent", true, true, 60],
            ]
        metric = [
                    #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]                 
                    ["AllMetrics", true, true, 60],
        ]
        }   
    }
}