node {
    def groovyfile = null
try{
    stage('Checkout') {
        // Checkout source code from Git repository
        sh 'echo "cloning the code" '
        git branch: 'main', url: 'https://github.com/saiveerateja2000/aws_test_repo.git'
    }

    stage('Build') {
        sh 'echo "loading groovyfile" '
        // Attempt to load groovyfile
        groovyfile = load 'atom.groovy'
        // If groovyfile is null, abort the stage
        if (groovyfile == null) {
            error("Failed to load groovyfile. Aborting the stage.")
        }
    }

    stage('SonarQube Analysis') {
        // Run SonarQube analysis
        withSonarQubeEnv(installationName: 'sonarqube') {
            sh "echo 'hello world' "
        }
    }
    stage('SonarQube Analysis-2') {
    def scannerHome = tool 'SonarScanner';
    withSonarQubeEnv() {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }

    stage('Test') {
        // Run tests (example: JUnit)
        sh 'echo "hello3" '
        try {
            groovyfile.building()
            sh "echo 'Current build result2: ${currentBuild.currentResult}' "
            currentBuild.result = 'SUCCESS'
            sh "echo 'Current build result3: ${currentBuild.result}' "
        } catch(e) {
            echo 'An error occurred during unit testing. Aborting pipeline.'
            currentBuild.result = 'ABORTED'
            throw e
        }
    }

    if (currentBuild.result == 'SUCCESS') {
        stage('Success') {
            // Deploy the application (example: Docker)
            echo "hello4"
        }
    }else {
        stage('Failure') {
            echo 'aborted'
        }
    }
}catch(exc){
    echo "something went wrong"
    throw exc}
}


