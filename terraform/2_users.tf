# #--- Admin User (CONNECT_MANAGED directory) ---
resource "aws_connect_user" "admin" {
  #depends_on  = [data.aws_connect_security_profile.admin, data.aws_connect_routing_profile.basic]

  instance_id = aws_connect_instance.test.id
  # Login credentials (CONNECT_MANAGED only)
  name                 = "my_admin"
  password             = "Password1234"
  routing_profile_id   = aws_connect_routing_profile.test.routing_profile_id
  security_profile_ids = [data.aws_connect_security_profile.admin.arn]

  identity_info {
    first_name = "AdminF"
    last_name  = "AdminL"
    email      = "Admin@Admin.com"
  }

  phone_config {
    phone_type                    = "SOFT_PHONE"
    after_contact_work_time_limit = 0
    auto_accept                   = true
    # desk_phone_number             = null
  }
}

resource "aws_connect_user" "support_agent" {
  instance_id          = aws_connect_instance.test.id
  name                 = "support_agent"
  password             = "Password1234"
  routing_profile_id   = aws_connect_routing_profile.support.routing_profile_id #data.aws_connect_routing_profile.basic.id
  security_profile_ids = [data.aws_connect_security_profile.agent.arn]

  identity_info {
    first_name = "support"
    last_name  = "agent"
  }

  phone_config {
    after_contact_work_time_limit = 0
    phone_type                    = "SOFT_PHONE"
  }
}

resource "aws_connect_user" "service_agent" {
  instance_id          = aws_connect_instance.test.id
  name                 = "service_agent"
  password             = "Password1234"
  routing_profile_id   = aws_connect_routing_profile.service.routing_profile_id #data.aws_connect_routing_profile.basic.id
  security_profile_ids = [data.aws_connect_security_profile.agent.arn]

  identity_info {
    first_name = "service"
    last_name  = "agent"
  }

  phone_config {
    after_contact_work_time_limit = 0
    phone_type                    = "SOFT_PHONE"
  }
}

resource "aws_connect_user" "sales_agent" {
  instance_id          = aws_connect_instance.test.id
  name                 = "sales_agent"
  password             = "Password1234"
  routing_profile_id   = aws_connect_routing_profile.sales.routing_profile_id #data.aws_connect_routing_profile.basic.id
  security_profile_ids = [data.aws_connect_security_profile.agent.arn]

  identity_info {
    first_name = "sales"
    last_name  = "agent"
  }

  phone_config {
    after_contact_work_time_limit = 0
    phone_type                    = "SOFT_PHONE"
  }
}
