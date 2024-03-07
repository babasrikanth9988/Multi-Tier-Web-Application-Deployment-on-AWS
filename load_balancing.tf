# Define ELB for load balancing
resource "aws_lb" "web_lb" {
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]

  // Define other ELB settings...
}

# Define listener for ELB
resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  protocol          = "HTTP"
}

# Define target group for ELB
resource "aws_lb_target_group" "web" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  // Define other target group settings...
}

# Attach instances to target group
resource "aws_lb_target_group_attachment" "web" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web.id
}
