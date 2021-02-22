# Kusabi
Kusabi is a network library.

`Kusabi` in Japanese, `楔` means a wedge that used in architecture.

The feature is that it can be written in a writing style close to genuine. 

# Installation method 
You can use it by using cocoapods.
```Ruby
pod 'Kusabi'
```

# How to use
## Main usage
If you want to get the HTML of a web page, do it like this.

```Swift
import Kusabi

func someFunction() {

  // first, you have to create Kusabi object
  let kusabi = Kusabi(URL: "https://google.com", 
                      cachePolicy: .reloadIgnoringCacheData, 
                      timeOut: 100)

  // then, you can GET by this
  kusabi.GET(completion: { result in
          
                //html
                let html = String(data: result!.body!,
                                  encoding: .utf8)
                                  
                print(html)
            })
}

```
