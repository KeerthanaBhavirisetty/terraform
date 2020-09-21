resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = data.aws_caller_identity.current.account_id
  peer_vpc_id   = data.aws_vpcs.current.ids
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_region   = "us-west-2"
  auto_accept   = false

  tags = {
    Side = "Requester"
  }
}