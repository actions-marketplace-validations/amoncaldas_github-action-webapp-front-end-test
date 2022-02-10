# Test webapp front-end with node

This GitHub Action provides an evironment for testing web applications with javascript using node commands.
The environment uses buntu:18.04 and includes:
- unzip
- curl 
- wget 
- git
- nodejs
- npm
- chrome 
- firefox
- default-jdk

In the entry point it runs:
- npm ci (equivalent to npm install)
- npm rebuild node-sass
- npm run <target> (target present in `package.json`. The default is `test`)

## Configuration

For help storing this see the [GitHub docs](https://help.github.com/en/articles/creating-a-github-action).
 
Create a new Actions workflow in your selected GitHub repository. If you don't already have a workflow file, 
you'll need to create a new file titled `action.yml` in the `.github/workflows` directory of your repository.  
Under "Edit new file", paste the following code:

```yaml
on: push
name: Example Workflow
jobs:
  runNpmTarget:
    name: Run webapp front-end test
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1.1
    - name: Run NPM target
      uses: amoncaldas/github-action-webapp-front-end-test@v1.4
      with:
        target: 'custom-target'  # Remove `with` section to run default target `test`
```

We strongly recommend that you update the `uses: amoncaldas/github-actions-npm-with-node-sass@v1.3` to reference 
the latest tag in the [amoncaldas/github-action-webapp front-end test repository](https://github.com/amoncaldas/github-action-webapp-front-end-test). 
This will pin your workflow to a particular version of the `amoncaldas/github-actions-npm-with-node-sass` action.

If you already have a `action.yml` file, copy and paste the above `runNpmTarget` job declaration 
into the `jobs` section in your existing `action.yml` file. If you wish to verify that you've 
pasted the above correctly, you can go into the visual editor and ensure that there are no syntax errors.

As shown in the above example, the workflow should run on the `push` event.

## Troubleshooting

Once your workflow has been created, the best way to confirm that the workflow is executing correctly 
is to create a new pull request with the workflow file and verify that the newly created action succeeds.

If the action fails, there may be a problem with your configuration. To investigate, dig into the 
action's logs to view any error messages.
