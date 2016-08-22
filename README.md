# KolodaView

An example of how to use [Koloda](https://github.com/Yalantis/Koloda) with [Carthage](https://github.com/Carthage/Carthage) dependency manager

## Steps to integrate it:

1. Create a Cartfile
2. Add to the file `github "Yalantis/Koloda"`
3. Run in the terminal `carthage update --platform iOS`
4. Open project file
5. Open general settings, add `pop` and `Koloda` to `Linked frameworks and Libraries` (from `Carthage/Build/iOS` directory)
6. Go to build phases settings, create a run script phase
7. Add the following script: `/usr/local/bin/carthage copy-frameworks`
8. Add the input files: 
 
	```
	$(SRCROOT)/Carthage/Build/iOS/pop.framework
	$(SRCROOT)/Carthage/Build/iOS/Koloda.framework
	```
	
	As a result you should get:
	![preview](resources/build_phase.png)
		
9. Build the project
