node {
        tools{
                jdk 'java'
        }
        def groovyfile = null
        stage('Checkout') {
                // Checkout source code from Git repository
                sh 'which java'
                sh 'env |grep -e JAVA_HOME'
                sh 'echo "hello" '
                withGroovy(tool:'4.0.9'){
                sh 'groovy --version'
                }
                //groovyfile = load("cicd.groovy")
        }
        if ( groovyfile != null) {
        stage('Build') {
                // Build the project (example: Maven)
                sh 'echo "hello2" '
                withGroovy {
                groovyfile = load("atom.groovy")
                }
        }
        
        stage('Test') {
                // Run tests (example: JUnit)
                sh 'echo "hello3" '
        }
        
        stage('Deploy') {
                // Deploy the application (example: Docker)
                sh 'echo "hello4" '
        }
        }
    }
    

