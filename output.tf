output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "Login-master" {
  value = "ssh -i ${aws_key_pair.keypair1.key_name} ubuntu@${aws_instance.ec2-master.public_ip}"
}

output "Login-worker" {
  value = "ssh -i ${aws_key_pair.keypair1.key_name} ubuntu@${aws_instance.ec2-worker.public_ip}"
}

