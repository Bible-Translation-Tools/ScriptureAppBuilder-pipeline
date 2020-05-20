module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.')
    context.log(req.query)
    if (req.query.appName && req.query.repoURL) {
        var responsebody = {
            success  : true,
            message  : "Your " + req.query.appName + " App is building",
            link     : process.env["FILE_LINK"] + req.query.appName + "-1.0.apk" + process.env["FILE_TOKEN"] ,
            appName  : req.query.appName,
            JobId    : generateGUID(),
            JobStatus: "Starting"
        }
        context.bindings.outputQueueBuilderItem = {
            JobID  : responsebody.JobId,
            appName: req.query.appName,
            repoURL: removeSlash(req.query.repoURL)
        }
        context.bindings.outputQueueMonitorItem = {
            JobID     : responsebody.JobId,
            appName   : req.query.appName,
            InputPhone: req.query.Phone
        }
        context.res = {
            status     : 200,
            contentType: "application/json",
            body       : responsebody
        }
        context.log(context.outputQueueBuilderItem)
    }
    else {
        context.res = {
            status: 400,
            body: "Please pass a valid query string"
        };
    }
};

function removeSlash(site)     
{     
    return site.replace(/\/$/, "");
};

function generateGUID(a){return a?(a^Math.random()*16>>a/4).toString(16):([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g,b)};