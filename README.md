# Tizen Studio CLI

CLI tool for Tizen Studio

## Options
| Name       	 | Description                                              | Mandatory | Type     | Default  |
|------------- |--------------------------------------------------------- |---------- |--------- |--------- |
| debug |  debug output |   |  Boolean |  false |
| command | command (build-native,build-web,package,security-profiles,list_rootstrap)  | O | String  |   |
| working_directory |  where the base directory is for. |   |  String | ${{ github.workspace }}  |
| strip |  **package** strip the native binary. (on,off) |   | String  | "off"  |
| output |  **package** output file path. |   | String  |   |
| reference | **package** reference project paths for HybridApp package.  |   |  String |   |
| security_profile | **package** security profile name. |   |  String |   |
| packaging_type |  **package** packaging type. (tpk,wgt) |   | String  |   |
| build_mode |  **build-native** build mode. (Debug,Release) |   |  String |  "Debug" |
| architecture |  **build-native** architecture type. (x86,x86_64,ar,aarch64) |   | String  | "x86"  |
| compiler |  **build-native** compiler choice. (gcc,llvm) |   |  String | "llvm"  |
| symbol |  **build-native** predefined symbol. |   |  String |   |
| extra_option |  **build-native** extra build options. (asan,lsan,...) |   |  String |   |
| jobs |  **build-native** number of parallel bulids for the native app. |   |  Number |   |
| exclude | **build-web** list of exclude files by patterns. |   |  String |   |
| optimize |  **build-web** optimize the application size. |   |  Boolean |   |
| cert_name |  **security-profiles** certificate profile name |   |  String |   |
| author_cert_path | **security-profiles** author certificate path.  |   |  String |   |
| distributor_cert_path |  **security-profiles** distributor certificate path. |   | String  |   |
| author_certi_pass |  **security-profiles** author certificate password. |   |  String |   |
| distributor_certi_pass | **security-profiles** distributor certificate password.  |   |  String |   |


## Example

### Build basics

```yaml  
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build package with Tizen Studio
        uses: retzero/tizen-studio-cli-action@dev
        with:
          command: "build-native"
          rootstrap_name: "mobile-5.5-device.core"
          build_mode: "Debug"
          compiler: "llvm"
          architecture: "arm"
          working_directory: "${{ github.workspace }}"
```
