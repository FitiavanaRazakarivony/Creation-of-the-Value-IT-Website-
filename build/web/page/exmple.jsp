<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../admin/dashbord/bootstrap V5/css/bootstrap.min.css">
</head>
<body>
    <p>
        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
          Link with href
        </a>
        <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
          Button with data-bs-target
        </button>
      </p>
      <div class="collapse" id="collapseExample">
        <div class="card card-body">
          Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
        </div>
      </div>
</body>
<script>
    var myCollapsible = document.getElementById('myCollapsible')
    myCollapsible.addEventListener('hidden.bs.collapse', function () {
    // do something...
    })

    </script>
    <script>
        var myCollapse = document.getElementById('myCollapse')
    var bsCollapse = new bootstrap.Collapse(myCollapse, {
    toggle: false
    })

</script>
</html>