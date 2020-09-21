resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.studentapp-vpc.id
  peer_vpc_id   = data.aws_vpcs.current.ids
  peer_owner_id = data.aws_caller_identity.current.account_id
  auto_accept   = true

  tags = {
    Side = "Requester"
    Name = "VPC Peering between default and created VPC"
  }
}