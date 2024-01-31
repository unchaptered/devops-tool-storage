[< Backaward](../README.md)

# Asset Storage

Asset Storages can edit acl to "Public-Read".

Some kind of assets must be access at any time.

- For example : svg, favicon, images in email, logos in email etc on.


## Get Started

- Input

```tfvars
prefix="each_resource.tags.Name에 붙을 접두사"
suffix="each_resource.tags.Name에 붙을 접미사"

bucket_name="s3_bucket_resource.bucket_name에 할당될 이름, 접두사와 접미사를 포함"

tags={}
리소스에 할당하고 싶은 리소스 명
```

- Output

```
s3_bucket.bucket_name = "${prefix}-${bucket_name}-${suffix}"
s3_bucket.bucket_tags = merge(var.tags, {
    Name = "${prefix}-${bucket_name}-${suffix}"
})
```

## For Example

- Input

```tfvars
prefix="kevin-prod"
suffix="ap-ne-2"
bucket_name="asset_storage"
tags={
    manager="kevin"
}
```

- Ouptut

```
s3_bucket.bucket_name = "kevin-prod-asset_storage-ap-ne-2"
s3_bucket.bucket_tags = merge(var.tags, {
    Name = "kevin-prod-asset_storage-ap-ne-2"
})
```