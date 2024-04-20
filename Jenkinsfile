node {
        def groovyfile = null
        stage('Checkout') {
                // Checkout source code from Git repository
                sh 'echo "hello" '
                groovyfile = load 'atom.groovy'
        }
        if (groovyfile != null){
        stage('Build') {
                sh 'echo "hello2" '
        }
        
        stage('Test') {
                // Run tests (example: JUnit)
                sh 'echo "hello3" '
                //groovyfile.building()
        }}
        
        stage('Deploy') {
                // Deploy the application (example: Docker)
                sh 'echo "hello4" '
        }
    }
    

