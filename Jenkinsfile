node {
        def groovyfile = null
        stage('Checkout') {
                // Checkout source code from Git repository
                sh 'echo "hello" '
                //groovyfile = load("cicd.groovy")
        }
        if ( groovyfile != null) {
        stage('Build') {
                // Build the project (example: Maven)
                sh 'echo "hello2" '
                groovyfile = load("atom.groovy")
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
    

