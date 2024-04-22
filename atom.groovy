def building() {
    sh 'pwd'
    sh 'cd aws_test_repo'
    sh 'pwd'
    sh 'make executable'
}
return this
