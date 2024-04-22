node {
        def groovyfile = null
        stage('Checkout') {
                // Checkout source code from Git repository
                sh 'echo "hello" '
                //groovyfile = load 'atom.groovy'
        }
        stage('Build') {
                sh 'echo "hello2" '
                sh 'git clone "https://github.com/saiveerateja2000/aws_test_repo.git" '
                groovyfile = load 'aws_test_repo/atom.groovy'
        }
        if ( groovyfile != null){
        stage('Test') {
                // Run tests (example: JUnit)
                sh 'echo "hello3" '
                //sh 'echo "Current build result: ${currentBuild.currentResult}" '
                //sh "echo 'Current build result: ${currentBuild.result}' "
                sh "echo 'Current build result: ${currentBuild.currentResult}' "
                try{
		        groovyfile.building()
		}
		catch(e){
			currentBuild.result = 'ABORTED'
		}

        }
        }
	if (currentBuild.result == 'SUCCESS'){
        
        stage('Deploy') {
                // Deploy the application (example: Docker)
                sh 'echo "hello4" '
        }}
	else{
		sh "echo 'aborted' "}
    }
    

