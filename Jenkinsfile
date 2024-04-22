node {
        def groovyfile = null
        stage('Checkout') {
                // Checkout source code from Git repository
                sh 'echo "cloning the code" '
                //    sh 'git clone "https://github.com/saiveerateja2000/aws_test_repo.git" '
		git branch: 'main', url: 'https://github.com/saiveerateja2000/aws_test_repo.git'
        }
        stage('Build') {
                sh 'echo "loading groovyfile" '
                groovyfile = load 'atom.groovy'
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
			sh "echo 'Current build result2: ${currentBuild.currentResult}' "
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
    

