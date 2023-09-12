# lecture 1

- Set up development environment
   - Install VScode
   - Install move-analyzer
   - Install move-analyzer plugin at the VScode
   - Install sui binary

- start new move contract projects

```
$sui move new {project name}
```

```
Result; 

$sui move new my_first_package

my_first_package
 ├ Move.toml
 ├ Source
    ├ {filename}.move 
```

- build move project

```
sui move build
```

- deploy project

```
$sui client publish --gas-budget {gas budget in mist unit}
```

- `SUI` binary's other command
    - `sui client gas` : check local stored address's 
    - `sui client active-address`


- Using key only
    - What is different use with key & store?
        -  if you do not explicitly implement a transfer method within the module, a struct instance that only has key can not be transferred again once it is given to an account address. 
   
    - How about using only store?
        - If you use only store it won't be possible to have that object be a stand alone object in the global storage pool. However it can still be included inside another struct
- Upgrade capability

# lecture 2 

- Usage of Option

- Usage of friend keyword
    - [Reference](https://diem.github.io/move/friends.html)
    - Usage:  The authorized Module under the current address is visible (it can be understood that Solidity introduces the visibility of function constraints, and generally authenticates the caller address)



- programmable transaction using TS sdk




# lecture 3

- Usage of assert 
    - Like revert

- Error Pastel case

- Address literal needs to add @

- Usage of init
    - It shouls has TxContext

- HotPotato pattern
    - Usage; Flash loan
    - Abstract : 

- Capability pattern
    - 

- One Time Witness pattern
    - For uniqueness declaration
        See create_currency

- Phantom types in std Coin lib

- Dynamic fields
    - Only store
- Dynamic object fields
    - key with store

- Table

- find out basic attributes ([Reference](https://move-language.github.io/move/abilities.html))
    - copy: Allows values of types with this ability to be copied.
    - drop: Allows values of types with this ability to be popped/dropped.
    - store: Allows values of types with this ability to exist inside a struct in global storage.
    - key: Allows the type to serve as a key for global storage operations.

- Doulbe init would be working?



# lecture 4

- Continue to Dynamic field oject

One Time Witness pattern
    - package.move lib


- Create Test file for Move contract


# Self research

- How about use entry function
  - Entry keyword is for transaction. 

- Input object limitation
 256KB ([Reference](https://mysten-labs.slack.com/archives/C04FTNEMMFX/p1676333052221769?thread_ts=1676332278.472739&cid=C04FTNEMMFX))

- [Storage fund](https://docs.sui.io/learn/tokenomics/storage-fund)
  - The deletion option should not be confused with deleting past transactions. Activity on Sui is finalized at each epoch boundary and past transactions are immutable and can never be reversed. The type of data that can be deleted is, for example, data corresponding to objects that are no longer live such as an NFT’s metadata, tickets that have been redeemed, auctions that have concluded, etc.

- What is `UpgradeCap` for?

- Pass object
  - Through mentioned as reference
    - Use `&` or `&mut`
      - Case of `&mut` mean that value will be changed
  - Through mentioned as Value
    - This object passing used in transfer or deletion, etc. 
  - Ways of the Object wrapping
    - Using `Option`
        - ```
        struct warrior has key {
            id: UID,
            weapon : Option<weapon>,
        }
        ```
        - Initialized with `option:none()`
        - necessary to use `option::extract` && `option::fill`. 
    - Using `Vector`
        - ```
        Struct warrior has key {
            id: UID, 
            weapon : vector<weapon>
        }
        ```
    - Using Mention directly
        - ```
        struct warrior has key {
            id:UID,
            weapon : weapon,
        }
        ```