def building() {
    sh '''
    pwd &&
    cd aws_test_repo &&
    pwd &&
    make executable '''
}
return this
