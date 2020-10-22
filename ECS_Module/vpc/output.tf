output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnets" {
  value = ["${aws_subnet.public.*.id}"]
}

output "public_subnets_cidr" {
  value = ["${aws_subnet.public.*.cidr_block}"]
}

output "public_subnets_az" {
  value = ["${aws_subnet.public.*.availability_zone}"]
}

output "private_subnets" {
  value = ["${aws_subnet.private.*.id}"]
}

output "private_subnets_cidr" {
  value = ["${aws_subnet.private.*.cidr_block}"]
}

output "private_subnets_az" {
  value = ["${aws_subnet.private.*.availability_zone}"]
}

output "public_route_table_id" {
  value = "${aws_route_table.public.*.id}"
}

output "private_route_table_ids" {
  value = ["${aws_route_table.private.*.id}"]
}