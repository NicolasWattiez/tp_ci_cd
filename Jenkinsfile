// Powered by Infostretch 

timestamps {

node () {
	stage ('tp5_free - Build - Purge') {
        script {
            def version = sh (
                script: "/var/jenkins_home/tools/hudson.plugins.gradle.GradleInstallation/gradle/bin/gradle purge",
                returnStdout: true
            ).trim()
            sh "echo purge old build"
        }
	}
	stage ('tp5_free - Build - Dependencies') {
        script {
            def version = sh (
                script: "/var/jenkins_home/tools/hudson.plugins.gradle.GradleInstallation/gradle/bin/gradle dependencies",
                returnStdout: true
            ).trim()
            sh "echo install dependancies"
        }
	}
	stage ('tp5_free - Build - package') {
        script {
            def version = sh (
                script: "/var/jenkins_home/tools/hudson.plugins.gradle.GradleInstallation/gradle/bin/gradle packageDistribution",
                returnStdout: true
            ).trim()
            sh "echo install dependancies"
        }
	}
}
}
