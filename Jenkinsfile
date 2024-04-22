node {
    def groovyfile = null

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

    stage('Test') {
        // Run tests (example: JUnit)
        sh 'echo "hello3" '
        try {
            groovyfile.building()
            sh "echo 'Current build result2: ${currentBuild.currentResult}' "
            sh "echo 'Current build result3: ${currentBuild.result}' "
            sh "echo 'current build result is ${currentBuild.rawBuild.getResult()}' "
        } catch(e) {
            //currentBuild.result = 'ABORTED'
            sh 'echo "catch is executed" '
            //error("An error occurred during testing. Aborting the stage.")
        }
    }

    if (currentBuild.currentResult == 'SUCCESS') {
        stage('Success') {
            // Deploy the application (example: Docker)
            sh 'echo "hello4" '
        }
    }else {
        stage('Failure') {
            sh "echo 'aborted' "
        }
    }
}


