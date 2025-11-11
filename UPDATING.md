# Updating

In order to update this chart from the upstream version, simply set the `ref` value in `vendir.yml`.

## Considerations

`values.yaml`:

If you need to regenerate the diff which patches `values.yaml`, you can use the following command:

```bash
git diff -U1 values.yaml
```

This is to ensure that the hunk size in the patch is as small as possible in order to avoid conflicts when updating.
