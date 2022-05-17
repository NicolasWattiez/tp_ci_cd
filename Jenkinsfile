pipeline {
 agent any
	stage ('tp5_free - Build - Purge') {
    tools {
      gradle 'gradle'
    }
    steps {
      sh 'gradle purge'
      sh 'gradle dependencies'
      sh 'gradle packageDistribution'
    }
	}
}
}
