elifePipeline {
    stage 'Checkout'
    checkout scm
    def commit = elifeGitRevision()
 
    stage 'Delta Lax backfill'
    lock('lax--prod') {
        // TODO: retrieve last commit, empty string is good
        def delta = sh(script: "./delta.sh ${commit}", returnStdout: true).trim()
        if (delta) {
            builderCmd "${delta}", 'lax--prod'
            // TODO: store $commit as the last commit
        }
    }
}
