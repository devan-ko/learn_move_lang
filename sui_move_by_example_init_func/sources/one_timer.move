module sui_move_by_example_init_func::one_timer {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};

    struct CreatorCapability has key {
        id: UID,
    }

    fun init (ctx: &mut TxContext){
        let creatorCap = CreatorCapability{
            id: object::new(ctx),
        };
        transfer::transfer(creatorCap, tx_context::sender(ctx))
    } 
}

// ----- Transaction Digest ----
// HYVjSorDPYK2m3J6c5wC7Vy4zJYSzySLsWB87WGVpE15
// ----- Transaction Data ----
// Transaction Signature: [Signature(Secp256k1SuiSignature(Secp256k1SuiSignature([1, 243, 57, 155, 6, 1, 221, 238, 180, 215, 52, 156, 26, 215, 56, 208, 50, 0, 28, 127, 187, 29, 10, 97, 241, 234, 24, 218, 48, 179, 108, 192, 217, 127, 14, 30, 195, 54, 228, 44, 166, 21, 208, 40, 178, 211, 178, 200, 153, 56, 46, 180, 221, 210, 211, 185, 129, 197, 73, 104, 95, 96, 15, 255, 192, 2, 21, 253, 184, 150, 150, 90, 225, 171, 89, 108, 157, 192, 61, 3, 124, 10, 101, 180, 181, 205, 210, 121, 116, 201, 212, 144, 213, 19, 168, 182, 220, 161])))]
// Transaction Kind : Programmable
// Inputs: [Pure(SuiPureValue { value_type: Some(Address), value: "0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8" })]
// Commands: [
//   Publish(<modules>,0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002),
//   TransferObjects([Result(0)],Input(0)),
// ]

// Sender: 0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8
// Gas Payment: Object ID: 0xd9125f754a5fe8425a6a1447e3fc0ce1cf0030075f44f0d3d7afa9dd7bc2a7b0, version: 0x67482d, digest: 28qSfwuPbtiAc87vsUkKWoZBit9eZuBGVRC8nwuHdDfb 
// Gas Owner: 0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8
// Gas Price: 1000
// Gas Budget: 10000000

// ----- Transaction Effects ----
// Status : Success
// Created Objects:
//   - ID: 0x00743cdc3acf4c431cf75d6edd7176dfa1ec190b86fbeab34501b6fc5d7d0a33 , Owner: Account Address ( 0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8 )
//   - ID: 0x5a94ca11f59c5149f9a461653adba3360e60eaa1fe95d0d3798fcc471c735d4c , Owner: Account Address ( 0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8 )
//   - ID: 0xdbb0f487e43d0313f7b245e167b928e3f2ef18fb919712564262fe10bda69b36 , Owner: Immutable
// Mutated Objects:
//   - ID: 0xd9125f754a5fe8425a6a1447e3fc0ce1cf0030075f44f0d3d7afa9dd7bc2a7b0 , Owner: Account Address ( 0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8 )

// ----- Events ----
// Array []
// ----- Object changes ----
// Array [
//     Object {
//         "type": String("mutated"),
//         "sender": String("0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8"),
//         "owner": Object {
//             "AddressOwner": String("0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8"),
//         },
//         "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
//         "objectId": String("0xd9125f754a5fe8425a6a1447e3fc0ce1cf0030075f44f0d3d7afa9dd7bc2a7b0"),
//         "version": String("6768686"),
//         "previousVersion": String("6768685"),
//         "digest": String("2FiXiJ2aAfKZSoUvBhVra44GLBMjxHqeKCCyXyHMGYkr"),
//     },
//     Object {
//         "type": String("created"),
//         "sender": String("0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8"),
//         "owner": Object {
//             "AddressOwner": String("0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8"),
//         },
//         "objectType": String("0x2::package::UpgradeCap"),
//         "objectId": String("0x00743cdc3acf4c431cf75d6edd7176dfa1ec190b86fbeab34501b6fc5d7d0a33"),
//         "version": String("6768686"),
//         "digest": String("FDKR2DVRymJyk8fQcrPYRK1RVZdg3aLxNGga5NZ8TUFk"),
//     },
//     Object {
//         "type": String("created"),
//         "sender": String("0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8"),
//         "owner": Object {
//             "AddressOwner": String("0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8"),
//         },
//         "objectType": String("0xdbb0f487e43d0313f7b245e167b928e3f2ef18fb919712564262fe10bda69b36::one_timer::CreatorCapability"),
//         "objectId": String("0x5a94ca11f59c5149f9a461653adba3360e60eaa1fe95d0d3798fcc471c735d4c"),
//         "version": String("6768686"),
//         "digest": String("FbaYyGXgYW52NUs63qKrEhbYjFHnMRNvAtMNrUrhaHwZ"),
//     },
//     Object {
//         "type": String("published"),
//         "packageId": String("0xdbb0f487e43d0313f7b245e167b928e3f2ef18fb919712564262fe10bda69b36"),
//         "version": String("1"),
//         "digest": String("H2jVYN2VgzRGmGXFHJG5P1XZX7V2YdP2gLCq37UJpJHi"),
//         "modules": Array [
//             String("one_timer"),
//         ],
//     },
// ]
// ----- Balance changes ----
// Array [
//     Object {
//         "owner": Object {
//             "AddressOwner": String("0xae0b950a3fcc72080b425994bd03d995c8ca890adcffef345c909efb0b316bb8"),
//         },
//         "coinType": String("0x2::sui::SUI"),
//         "amount": String("-8450280"),
//     },
// ] 