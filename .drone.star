def main(ctx):
    commit_message = ctx.build.message.lower()
    pipeline = []
    
    CI_Pipeline = {
        "kind": "pipeline",
        "name": "CI",
        "steps": {}
    }

    if "[no_ci]" in commit_message or "readme.md" in commit_message:
        pipeline.append(CI_Empty)
        return pipeline
    
    CI_Pipeline["steps"] = [Build_Model(),Build_Extension(), UnitTest()]
    pipeline.append(CI_Pipeline)
    return pipeline

def Build_Model():
    return {
        "name": "build_model",
        "image": "swift:latest",
        "commands": [
            "cd Model/",
            "swift build"
        ]
    }

def Build_Extension():
    return {
        "name": "build_extension",
        "image": "swift:latest",
        "commands": [
            "cd Extensions/",
            "swift build"
        ]
    }

def UnitTest():
    return {
        "name": "test_model",
        "image": "swift:latest",
        "commands": [
            "cd Model/",
            "swift test"
        ]
    }

def CI_Empty():
    return {
        "kind": "pipeline",
        "name": "EmptyPipeline",
        "steps": [
            
        ]
    }
    
    