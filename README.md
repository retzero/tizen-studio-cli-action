# Tizen Studio CLI

CLI tool for Tizen Studio

## Options
| Name       	 | Description                                              | Mandatory | Type     | Default  |
|------------- |--------------------------------------------------------- |---------- |--------- |--------- |


## Example

### Build basics

```yaml  
 steps:
    steps:
    - uses: actions/checkout@v2

    - name: Run build
      uses: retzero/tizen-studio-cli-action@master
      with:  
        command: "build-native"
```

