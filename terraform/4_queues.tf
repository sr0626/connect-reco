resource "aws_connect_queue" "test" {
  instance_id           = aws_connect_instance.test.id
  name                  = "My Default Queue"
  description           = "My Default Queue"
  hours_of_operation_id = aws_connect_hours_of_operation.test.hours_of_operation_id

  outbound_caller_config {
    outbound_caller_id_name = "My Outbound Caller ID"
    #outbound_caller_id_number_id = "" #Optional
    outbound_flow_id = data.aws_connect_contact_flow.default_outbound.contact_flow_id
  }
}

resource "aws_connect_queue" "sales" {
  instance_id           = aws_connect_instance.test.id
  name                  = "My Sales Queue"
  description           = "My Sales Queue"
  hours_of_operation_id = aws_connect_hours_of_operation.test.hours_of_operation_id

  outbound_caller_config {
    outbound_caller_id_name = "My Outbound Caller ID"
    #outbound_caller_id_number_id = "" #Optional
    outbound_flow_id = data.aws_connect_contact_flow.default_outbound.contact_flow_id
  }
}

resource "aws_connect_queue" "support" {
  instance_id           = aws_connect_instance.test.id
  name                  = "My Support Queue"
  description           = "My Support Queue"
  hours_of_operation_id = aws_connect_hours_of_operation.test.hours_of_operation_id

  outbound_caller_config {
    outbound_caller_id_name = "My Outbound Caller ID"
    #outbound_caller_id_number_id = "" #Optional
    outbound_flow_id = data.aws_connect_contact_flow.default_outbound.contact_flow_id
  }
}

resource "aws_connect_queue" "service" {
  instance_id           = aws_connect_instance.test.id
  name                  = "My Service Queue"
  description           = "My Service Queue"
  hours_of_operation_id = aws_connect_hours_of_operation.test.hours_of_operation_id

  outbound_caller_config {
    outbound_caller_id_name = "My Outbound Caller ID"
    #outbound_caller_id_number_id = "" #Optional
    outbound_flow_id = data.aws_connect_contact_flow.default_outbound.contact_flow_id
  }
}