---
inject: true
to: src/helpers/stateMachines/machine.js
after: states
---
        <%= name %>: {
            meta: {
                isAHistoryEntry: true,
                isAComponent: true,
                hash: ''
            },
            on: {
                NEXT: [
                    {
                        target: 'example'
                    }
                ],
                ...commonEvents
            }
        },