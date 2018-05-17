## Playing around with kubernetes and uniconv

Create the docker image (directly on minikube)
```
eval $(minikube docker-env)
docker build -t megatron:1.0.0 .
```

Deploy on minikube:
```
kubectl apply -f k8s/
```

Check that it works:
```
curl -s http://file-examples.com/wp-content/uploads/2017/02/file-sample_1MB.docx > sample.docx
curl -s --form file=@sample.docx http://`minikube ip`:32000/unoconv/pdf/ > sample.pdf
curl -s --form file=@sample.docx http://`minikube ip`:32000/unoconv/txt/ > sample.txt
```

We glue together the following projects:

* https://github.com/dagwieers/unoconv
* https://github.com/jordanorc/docker-unoconv-flask
